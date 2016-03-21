(define (problem robocup_symposium_experiments_1)
(:domain yb_general_domain)
(:objects

    ; robots
    youbot-brsu-5 - robot

    ; robot available platforms, to store objects inside the robot
    platform_middle platform_left platform_right - robot_platform

    ; grippers
    dynamixel - gripper
    
    ; locations
    S1 S2 S3 S4 S5 S6 - location
    START - location

    ; objects
    o1 - object
    o2 - object
    o3 - object
    o4 - object
    o5 - object
)
(:init
    ; initialize total cost
    (= (total-cost) 0)

    ; distance matrix lower triangle
    (= (path-length START S1) 3)
    (= (path-length START S2) 4)
    (= (path-length START S3) 7)
    (= (path-length START S4) 7)
    (= (path-length START S5) 7)
    (= (path-length START S6) 7)

    (= (path-length S1 S2) 4)
    (= (path-length S1 S3) 7)
    (= (path-length S1 S4) 7)
    (= (path-length S1 S5) 7)
    (= (path-length S1 S6) 7)

    (= (path-length S2 S3) 7)
    (= (path-length S2 S4) 7)
    (= (path-length S2 S5) 6)
    (= (path-length S2 S6) 6)

    (= (path-length S3 S4) 2)
    (= (path-length S3 S5) 3)
    (= (path-length S3 S6) 4)

    (= (path-length S4 S5) 2)
    (= (path-length S4 S6) 3)

    (= (path-length S5 S6) 2)

    ;----------------------------

    ; distance matrix upper repeated triangle information
    (= (path-length S1 START) 3)
    (= (path-length S2 START) 4)
    (= (path-length S3 START) 7)
    (= (path-length S4 START) 7)
    (= (path-length S5 START) 7)
    (= (path-length S6 START) 7)

    (= (path-length S2 S1) 4)
    (= (path-length S3 S1) 7)
    (= (path-length S4 S1) 7)
    (= (path-length S5 S1) 6)
    (= (path-length S6 S1) 7)

    (= (path-length S3 S2) 7)
    (= (path-length S4 S2) 7)
    (= (path-length S5 S2) 6)
    (= (path-length S6 S2) 6)

    (= (path-length S4 S3) 2)
    (= (path-length S5 S3) 3)
    (= (path-length S6 S3) 4)

    (= (path-length S5 S4) 2)
    (= (path-length S6 S4) 3)

    (= (path-length S6 S5) 2)

    ;---------------------------

    ; useless information, but required by some planners for completeness
    (= (path-length START START) 100)
    (= (path-length S1 S1) 100)
    (= (path-length S2 S2) 100)
    (= (path-length S3 S3) 100)
    (= (path-length S4 S4) 100)
    (= (path-length S5 S5) 100)
    (= (path-length S6 S6) 100)

    ; robot initial conditions : location
    (at youbot-brsu-5 START) ; youbot is at start position

    ; status of the gripper at the beginning
    (gripper_is_free dynamixel)

    ; where are the objects located?
    (on o1 S1)
    (on o2 S4)
    (on o3 S2)
    (on o4 S3)
    (on o5 S2)
)
(:goal (and
            ; transportation tasks
            (on o1 S5)
		    (on o2 S6)
            (on o3 S5)
            (on o4 S6)
            (on o5 S6)
        )
)
(:metric minimize (total-cost))
)
