(define (problem p5)
(:domain gpsr_domain)
(:objects

    ; robots
    mbot - robot

    ; persons
    pedro unknown_person - person
    
    ; locations
    ENTRANCE BEDROOM KITCHEN DINNING_ROOM BATHROOM - location
    LAUNDRY_ROOM CORRIDOR - location

    ; objects
    crackers coke milk cake banana - object
)
(:init
    ; initialize total cost
    (= (total-cost) 0)

    ; robot initial conditions : location
    (at_r mbot CORRIDOR) ; mbot is at CORRIDOR position

    (gripper_empty mbot)

    ; where are the objects located?
    (on crackers ENTRANCE)
    (on coke DINNING_ROOM)
    (on milk BEDROOM)
    (on cake CORRIDOR)
    (on banana ENTRANCE)
)
(:goal (and
            ; transportation tasks
            (on crackers BATHROOM)
            (on coke LAUNDRY_ROOM)
            (on milk DINNING_ROOM)
            (on cake KITCHEN)
            (on banana KITCHEN)
        )
)
(:metric minimize (total-cost))
)
