#ifndef _VALIDATE_PLAN_
#define _VALIDATE_PLAN_

#include "validate.h"
#include "State.h"
#include "Plan.h"
#include "Validator.h"
#include "typecheck.h"
#include "RobustAnalyse.h"
#include "ptree.h"
#include "FlexLexer.h"
#include "Utils.h"

#include "LaTeXSupport.h"

#include <boost/filesystem.hpp>

using namespace VAL;

class PlanValidator
{
    public:
        PlanValidator();
        virtual ~PlanValidator();
        bool validate(std::string domain_path, std::string problem_path, std::string plan_path);
        bool checkFileExistance(std::string file_path);
    private:
        bool executePlans(std::string plan_path, int & argcount,TypeChecker & tc,const DerivationRules * derivRules,double tolerance,bool lengthDefault,bool giveAdvice);
        vector<plan_step *> getTimedInitialLiteralActions();
        plan * getPlan(std::string plan_path,int & argcount,TypeChecker & tc,vector<string> & failed,string & name);
        
        typedef map<double,vector<pair<string,vector<double> > > > Ranking;
};
#endif
