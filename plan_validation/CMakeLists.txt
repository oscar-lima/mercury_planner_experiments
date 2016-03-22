cmake_minimum_required(VERSION 2.8.3)
project(plan_validation)

find_package(Boost COMPONENTS thread system filesystem REQUIRED)

include_directories(
    include
    include/Parser
    ${Boost_INCLUDE_DIRS}
)

### LIBRARY
add_library(pddl+ src/pddl+.cpp)
add_library(ptree src/ptree.cpp)
add_library(Action src/Action.cpp)
add_library(Proposition src/Proposition.cpp)
add_library(FuncExp src/FuncExp.cpp)
add_library(typecheck src/typecheck.cpp)
add_library(Validator src/Validator.cpp)
add_library(RepairAdvice src/RepairAdvice.cpp)
add_library(LaTeXSupport src/LaTeXSupport.cpp)
add_library(State src/State.cpp)
add_library(Plan src/Plan.cpp)
add_library(Ownership src/Ownership.cpp)
add_library(Environment src/Environment.cpp)
add_library(Polynomial src/Polynomial.cpp)
add_library(DebugWriteController src/DebugWriteController.cpp)
add_library(Utils src/Utils.cpp)
add_library(TrajectoryConstraints src/TrajectoryConstraints.cpp)
add_library(RobustAnalyse src/RobustAnalyse.cpp)
add_library(random src/random.cpp)
add_library(Events src/Events.cpp)
add_library(PrettyPrinter src/PrettyPrinter.cpp)

set(VALIDATE_LIB
    pddl+
    ptree
    FuncExp
    typecheck
    Validator
    Action
    Proposition
    RepairAdvice
    LaTeXSupport
    State
    Plan
    Ownership
    Environment
    Polynomial
    DebugWriteController
    Utils
    TrajectoryConstraints
    RobustAnalyse
    random
    Events
    PrettyPrinter   
)

### EXECUTABLES
add_executable(plan_validator src/plan_validator.cpp)
target_link_libraries(plan_validator 
    ${VALIDATE_LIB}
    ${Boost_LIBRARIES}
)
