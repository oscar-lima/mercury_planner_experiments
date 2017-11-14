(define (problem p1)
(:domain gpsr_domain)
(:objects

    ; robots
    mbot - robot
    
    ; locations
    ENTRANCE BEDROOM KITCHEN DINNING_ROOM BATHROOM - location
    LAUNDRY_ROOM CORRIDOR - location

    ; person
    pedro maria diogo salvador monica - person
)
(:init
    ; initialize total cost
    (= (total-cost) 0)

    ; robot initial conditions : location
    (at_r mbot CORRIDOR) ; mbot is at CORRIDOR position

    (gripper_empty mbot)

    ; where are the objects located?
    (at_p pedro ENTRANCE)
    (at_p maria KITCHEN)
    (at_p diogo KITCHEN)
    (at_p salvador BEDROOM)
    (at_p monica DINNING_ROOM)
)
(:goal (and
            ; transportation tasks
            (at_p pedro BATHROOM)
            (at_p maria LAUNDRY_ROOM)
            (at_p diogo DINNING_ROOM)
            (at_p salvador BATHROOM)
            (at_p monica LAUNDRY_ROOM)
        )
)
(:metric minimize (total-cost))
)
