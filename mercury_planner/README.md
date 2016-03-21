mercury planner
===============

This planner was used in ipc 2014, and scored high in the transport domain, hence we use it
for robocup at work, which has a similar domain.

The following instructions were tested under ubuntu 14.04 , 64 bit PC

1. Download the planner

        wget https://helios.hud.ac.uk/scommv/IPC-14/repo_planners/Mercury-fixed.zip

2. Install dependencies

        sudo apt-get install bison flex gawk g++-multilib pypy
        
3. Unzip only sequential satisfactory (seq-sat-mercury)

        unzip Mercury-fixed.zip -x seq-agl-mercury.tar.gz && tar -xf seq-sat-mercury.tar.gz

4. Compile the program:

        cd seq-sat-mercury
        ./build

wait unitl is done... (about 3 min on a i7 PC)

5. test the planner:

provide with domain.pddl and problem.pddl (problem pddl definition) at the root of the directory.

        ./plan domain.pddl problem.pddl plan

if you dont have a domain.pddl and problem.pddl there is one simple example at the end of this wiki, 

just scroll down and copy paste it into domain.pddl and problem.pddl files.
        
6. Done! Now you should be able to see many plans happening, with different heuristics,

you might have to stop the last heuristics because they take a long time or even hang apparently.

for the example at the end of this wiki the output looks like this:

        .
        .
        .
        clean ghost loca (1)
        move ghost loca locb (1)
        clean ghost locb (1)
        move ghost locb loca (1)
        Plan length: 4 step(s).
        .
        .
        .
        etc...


ADDITIONAL INFORMATION ABOUT THE PLANNER
========================================

The plan happens in three steps, translate, process and search. They are all handled by a script 

system structure that basically calls binaries with a lot of arguments.

The translate step receives pddl and transforms into output.sas file, the preprocess step receives

"output.sas" file and transforms into "output" file.


The search is finally performed into output file, but it also creates intermediate output inside search folder

that are handled by donward script. You cannot access those temp files because they are removed by the script

afterwards. If you want to run the search only you can do it by using the following command:

7. inside search folder call plan script like this:

        ./downward < output ipc seq-sat-mercury --plan-file plan

if you want to perform only one search instead of many heuristic search you can do it by using the intermediate file, 

which can be find under the name of:

        downward.tmp.18609
        
or something similar (changes on each run) 

Then use that intermediate file as input to downward-1 binary (inside src/search) which can be

called with the following command

        ./downward-1 --heuristic "hrb=RB(cost_type=1, extract_plan=true, next_red_action_test=true, applicable_paths_first=true, use_connected=true)" --heuristic "hlm2=lmcount(lm_rhw(reasonable_orders=true,lm_cost_type=2,cost_type=2))" --search "lazy_wastar([hrb,hlm2],preferred=[hrb,hlm2],w=3)" --plan-file plan < temp_file.temp

This will run the best heuristic that I could see in console. Fast and efficient (subjective argument). It is based on the Black red heuristic

RB, which is the mercury contribution.


Changes to the original planner
===============================

Slight changes/adaptations were done for removing the iterative search of the planner and perform only one search (the best search),

and store the plan under plan folder with the name plan.plan

Those changes involve the creation of clean.sh script to remove temp files after plan completition of script

and modifications to src/search/downward script

domain.pddl example
===================

(define (domain cleaning_robot)

  (:requirements
    :typing
  )

  (:types
    location
    robot
  )

  (:predicates
    (at ?r - robot ?l - location)       ; robot r? is at location l?
    (clean ?l - location)                       ; location ?l is clean
  ) 

  (:action move
    :parameters (?r - robot ?source ?destination - location)
    :precondition (at ?r ?source)
    :effect (and    ( not (at ?r ?source))
                                (at ?r ?destination)
                )
  )

  (:action clean
    :parameters (?r - robot ?l - location)
    :precondition (and (at ?r ?l) (not(clean ?l)))
    :effect (clean ?l)
  )
)

problem.pddl example
====================

(define (problem p01)
        
  (:domain cleaning_robot)

  (:objects 
        ghost - robot
        locA locB - location
  )

  (:init 
        (at ghost locA)
        (not(clean locA))
        (not(clean locB))
        
  ) 

  (:goal
        (  and  (at ghost locA)
                (clean locB)
                (clean locA)
        )
  )
)
