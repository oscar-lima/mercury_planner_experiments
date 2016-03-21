#include <plan_validator.h>
#include <string>
#include <cstdio>
#include <iostream>
#include <fstream>
#include <time.h>

using std::ifstream;
using std::ofstream;
using std::cerr;
using std::cout;
using std::for_each;
using std::copy;

extern int yyparse();
extern int yydebug;

namespace VAL
{
    parse_category* top_thing = NULL;

    analysis an_analysis;
    analysis* current_analysis;

    yyFlexLexer* yfl;
    int Silent;
    bool Verbose;
    bool ContinueAnyway;
    bool ErrorReport;
    bool InvariantWarnings;
    bool LaTeX;

    ostream * report = &cout;
}

using namespace VAL;
char * current_filename;

PlanValidator::PlanValidator() {}

PlanValidator::~PlanValidator() {}

bool PlanValidator::validate(std::string domain_path, std::string problem_path, std::string plan_path)
{
    try 
    {
        current_analysis= &an_analysis;

        Silent = 0;
    
        Verbose = false;
        ContinueAnyway = false;
        ErrorReport = false;
        
        Robust = false;
        JudderPNEs = false;
        EventPNEJuddering = false;
        TestingPNERobustness = false;
        RobustPNEJudder = 0;

        InvariantWarnings = false;
        LaTeX = false;
        ofstream possibleLatexReport;
        makespanDefault = false;
        stepLengthDefault = false;
        
        bool CheckDPs = true;
        bool giveAdvice = true;

        double tolerance = 0.01;
        bool lengthDefault = true;
        double robustMeasure = 0;
        int noTestPlans = 1000;
            
        bool calculateActionRobustness = false;
        bool calculatePNERobustness = false;
        RobustMetric robustMetric = MAX;
        RobustDist robustDist = UNIFORM;

        string s;
        bool ganttObjectsGot = false;

        int argcount = 1;
        
        ifstream domainFile(domain_path.c_str());
        if(!domainFile)
        {
            cerr << "Plan validation tool : Bad domain file!, does it exist?\n";
            return false;
        }

        yfl= new yyFlexLexer(&domainFile,&cout);

        yydebug=0;
        yyparse();
        delete yfl;

        TypeChecker tc(current_analysis);

        bool typesOK = tc.typecheckDomain();

        if(!typesOK)
        {
            cerr << "Plan validation tool : Error - Type problem in domain description!, PDDL domain wrongly formed\n";
            return false;
        }
        
        ifstream problemFile(problem_path.c_str());
        if(!problemFile)
        {
            cerr << "Plan validation tool : Error - Bad PDDL problem file!, does it exist?\n";
            return false;
        }

        yfl = new yyFlexLexer(&problemFile,&cout);
        yyparse();
        delete yfl;

        if(!tc.typecheckProblem())
        {
            cerr << "Plan validation tool : Type problem in problem specification!, PDDL problem wrongly formed\n";
            return false;
        }

        const DerivationRules * derivRules = new DerivationRules (an_analysis.the_domain->drvs,an_analysis.the_domain->ops);

        // run plans and evaluate if they fulfill the goals
        if (executePlans(plan_path, argcount,tc,derivRules,tolerance,lengthDefault,giveAdvice))
        {
            delete derivRules;
            return true;
        }
        else
        {
            return false;
        }
    }
    catch(exception & e)
    {
        cerr << "Error: " << e.what();
        return false;
    }
    return false;
}

plan * PlanValidator::getPlan(std::string plan_path,int & argcount,TypeChecker & tc,vector<string> & failed,string & name)
{
    plan * the_plan;

    ifstream planFile(plan_path.c_str());
    if(!planFile)
    {
        failed.push_back(name);
        //Bad plan file!
        the_plan = 0; return the_plan;
    }

    yfl = new yyFlexLexer(&planFile,&cout);
    yyparse();
    delete yfl;

    the_plan = dynamic_cast<plan*>(top_thing);

    if(!the_plan || !tc.typecheckPlan(the_plan))
    {
        failed.push_back(name);

        //Bad plan description!
        delete the_plan;
        the_plan = 0; 
        
        return the_plan;
    }

    if(the_plan->getTime() >= 0)
    {
        name += " - Planner run time: ";
        name += toString(the_plan->getTime());
    }

    return the_plan;
}

vector<plan_step *> PlanValidator::getTimedInitialLiteralActions()
{
    vector<plan_step *> timedIntitialLiteralActions;

    if(an_analysis.the_problem->initial_state->timed_effects.size() != 0)
    {
        int count = 1;
        for(pc_list<timed_effect*>::const_iterator e = an_analysis.the_problem->initial_state->timed_effects.begin(); e != an_analysis.the_problem->initial_state->timed_effects.end(); ++e)
        {
            operator_symbol * timed_initial_lit = an_analysis.op_tab.symbol_put("Timed Initial Literal Action "+ toString(count++));

            action  * timed_initial_lit_action = new action(timed_initial_lit,new var_symbol_list(),new conj_goal(new goal_list()),(*e)->effs,new var_symbol_table());

            plan_step * a_plan_step =  new plan_step(timed_initial_lit,new const_symbol_list());
            a_plan_step->start_time_given = true;
            a_plan_step->start_time = dynamic_cast<const timed_initial_literal *>(*e)->time_stamp;

            a_plan_step->duration_given = false;

            timedIntitialLiteralActions.push_back(a_plan_step);
            an_analysis.the_domain->ops->push_back(timed_initial_lit_action);
        }
    }

    return timedIntitialLiteralActions;
}

//execute all the plans in the usual manner without robustness checking
bool PlanValidator::executePlans(std::string plan_path, int & argcount,TypeChecker & tc,const DerivationRules * derivRules,double tolerance,bool lengthDefault,bool giveAdvice)
{
    Ranking rnk;
    Ranking rnkInv;
    vector<string> failed;
    vector<string> queries;
    
    string name(plan_path.c_str());

    plan * the_plan = getPlan(plan_path, argcount, tc, failed,name);

    plan * copythe_plan = new plan(*the_plan);
    plan * planNoTimedLits = new plan();
    vector<plan_step *> timedInitialLiteralActions = getTimedInitialLiteralActions();
    double deadLine = 101;

    //add timed initial literals to the plan from the problem spec
    for(vector<plan_step *>::iterator ps = timedInitialLiteralActions.begin(); ps != timedInitialLiteralActions.end(); ++ps)
    {
        the_plan->push_back(*ps);
    }

    //add actions that are not to be moved to the timed intitial literals otherwise to the plan to be repaired
    //i.e. pretend these actions are timed initial literals
    for(pc_list<plan_step*>::const_iterator i = copythe_plan->begin(); i != copythe_plan->end(); ++i)
    {
            planNoTimedLits->push_back(*i);
    }

    copythe_plan->clear(); delete copythe_plan;

    PlanRepair pr(timedInitialLiteralActions,deadLine,derivRules,tolerance,tc,an_analysis.the_domain->ops,
                            an_analysis.the_problem->initial_state,
                            the_plan,planNoTimedLits,an_analysis.the_problem->metric,lengthDefault,
                            an_analysis.the_domain->isDurative(),an_analysis.the_problem->the_goal,current_analysis);
    bool showGraphs = false;

    try 
    {
        if(pr.getValidator().execute())
        {
            //Plan executed successfully - checking goal
            if(pr.getValidator().checkGoal(an_analysis.the_problem->the_goal))
            {
                if(!(pr.getValidator().hasInvariantWarnings()))
                {
                    vector<double> vs(pr.getValidator().finalValue());
                    rnk[vs[0]].push_back(make_pair(name,vs));
                    
                    //Plan valid
                    return true;
                }
                else
                {
                    //Plan valid, subject to further invariant checks
                    
                    if(Silent > 1)
                    {
                        //failed
                        return false;
                    }
                }
            }
            else
            {
                    failed.push_back(name);
                    
                    //Goal not satisfied, plan invalid
                    return false;
            }
        }
        else
        {
            failed.push_back(name);
            if(ContinueAnyway)
            {
                //Plan failed to execute - checking goal
                if(!pr.getValidator().checkGoal(an_analysis.the_problem->the_goal))
                {
                    //Goal not satisfied
                    return false;
                }
            }
            else 
            {
                //Plan failed to execute
                return false;
            }
        }
        
        if(pr.getValidator().hasInvariantWarnings())
        {
            pr.getValidator().displayInvariantWarnings();
            return false;
        }
        return false;
    }
    catch(exception & e)
    {
        cout << "Error occurred in validation attempt:\n  " << e.what() << "\n";
        return false;
    }

    planNoTimedLits->clear();
    delete planNoTimedLits;
    delete the_plan;

    return false;
}

int main(int argc,char * argv[])
{
    // to test the validator class
    PlanValidator pv;
    
    if (argc != 4)
    {
        std::cout << "USAGE : ./plan_validator domain_path problem_path plan_path" << std::endl;
        return 0;
    }
    
    std::string domain_path = argv[1];
    std::string problem_path = argv[2];
    std::string plan_path = argv[3];
    
    if (pv.validate(domain_path, problem_path, plan_path))
    {
        cout << "true" << std::endl;
    }
    else
    {
        cout << "false" << std::endl;
    }
    
    return 0;
}