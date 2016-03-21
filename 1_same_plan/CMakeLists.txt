cmake_minimum_required(VERSION 2.8.3)
project(1_same_plan)

find_package(catkin REQUIRED COMPONENTS)

catkin_package(CATKIN_DEPENDS)

include_directories(
    #common/include/
    #ros/include/
    #${catkin_INCLUDE_DIRS}
)

# ### library
# add_library(path_length_calculator common/src/path_length_calculator.cpp)
# 
# ### EXECUTABLES
# add_executable(path_length_calculator_node ros/src/path_length_calculator_node.cpp)
# target_link_libraries(path_length_calculator_node ${catkin_LIBRARIES} path_length_calculator)
# 
# add_executable(pose_array_to_path_node ros/src/pose_array_to_path_node.cpp)
# target_link_libraries(pose_array_to_path_node ${catkin_LIBRARIES})
