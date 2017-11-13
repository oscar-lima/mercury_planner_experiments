(define (problem p13)
(:domain gpsr_domain_w_cost)
(:objects

    ; robots
    mbot - robot

    ; persons
    pedro unknown_person - person
    
    ; locations
    ENTRANCE BEDROOM KITCHEN DINNING_ROOM BATHROOM - location
    LAUNDRY_ROOM CORRIDOR - location

    ; objects
    crackers coke milk cake banana hair_spray pen juice - object
    tuna napkin photo headphones laptop - object
)
(:init
    ; initialize total cost
    (= (total-cost) 0)

    ; distance matrix lower triangle
    (= (path-length CORRIDOR ENTRANCE) 3)
    (= (path-length CORRIDOR BEDROOM) 4)
    (= (path-length CORRIDOR KITCHEN) 7)
    (= (path-length CORRIDOR DINNING_ROOM) 7)
    (= (path-length CORRIDOR BATHROOM) 7)
    (= (path-length CORRIDOR LAUNDRY_ROOM) 7)

    (= (path-length ENTRANCE BEDROOM) 4)
    (= (path-length ENTRANCE KITCHEN) 7)
    (= (path-length ENTRANCE DINNING_ROOM) 7)
    (= (path-length ENTRANCE BATHROOM) 7)
    (= (path-length ENTRANCE LAUNDRY_ROOM) 7)

    (= (path-length BEDROOM KITCHEN) 7)
    (= (path-length BEDROOM DINNING_ROOM) 7)
    (= (path-length BEDROOM BATHROOM) 6)
    (= (path-length BEDROOM LAUNDRY_ROOM) 6)

    (= (path-length KITCHEN DINNING_ROOM) 2)
    (= (path-length KITCHEN BATHROOM) 3)
    (= (path-length KITCHEN LAUNDRY_ROOM) 4)

    (= (path-length DINNING_ROOM BATHROOM) 2)
    (= (path-length DINNING_ROOM LAUNDRY_ROOM) 3)

    (= (path-length BATHROOM LAUNDRY_ROOM) 2)

    ;----------------------------

    ; distance matrix upper repeated triangle information
    (= (path-length ENTRANCE CORRIDOR) 3)
    (= (path-length BEDROOM CORRIDOR) 4)
    (= (path-length KITCHEN CORRIDOR) 7)
    (= (path-length DINNING_ROOM CORRIDOR) 7)
    (= (path-length BATHROOM CORRIDOR) 7)
    (= (path-length LAUNDRY_ROOM CORRIDOR) 7)

    (= (path-length BEDROOM ENTRANCE) 4)
    (= (path-length KITCHEN ENTRANCE) 7)
    (= (path-length DINNING_ROOM ENTRANCE) 7)
    (= (path-length BATHROOM ENTRANCE) 6)
    (= (path-length LAUNDRY_ROOM ENTRANCE) 7)

    (= (path-length KITCHEN BEDROOM) 7)
    (= (path-length DINNING_ROOM BEDROOM) 7)
    (= (path-length BATHROOM BEDROOM) 6)
    (= (path-length LAUNDRY_ROOM BEDROOM) 6)

    (= (path-length DINNING_ROOM KITCHEN) 2)
    (= (path-length BATHROOM KITCHEN) 3)
    (= (path-length LAUNDRY_ROOM KITCHEN) 4)

    (= (path-length BATHROOM DINNING_ROOM) 2)
    (= (path-length LAUNDRY_ROOM DINNING_ROOM) 3)

    (= (path-length LAUNDRY_ROOM BATHROOM) 2)

    ;---------------------------

    ; useless information, but required by some planners for completeness
    (= (path-length CORRIDOR CORRIDOR) 100)
    (= (path-length ENTRANCE ENTRANCE) 100)
    (= (path-length BEDROOM BEDROOM) 100)
    (= (path-length KITCHEN KITCHEN) 100)
    (= (path-length DINNING_ROOM DINNING_ROOM) 100)
    (= (path-length BATHROOM BATHROOM) 100)
    (= (path-length LAUNDRY_ROOM LAUNDRY_ROOM) 100)

    ; robot initial conditions : location
    (at_r mbot CORRIDOR) ; mbot is at CORRIDOR position

    (gripper_empty mbot)

    ; where are the objects located?
    (on crackers ENTRANCE)
    (on coke DINNING_ROOM)
    (on milk BEDROOM)
    (on cake CORRIDOR)
    (on banana ENTRANCE)
    (on hair_spray BEDROOM)
    (on pen LAUNDRY_ROOM)
    (on juice DINNING_ROOM)
    (on tuna LAUNDRY_ROOM)
    (on napkin BATHROOM)
    (on photo DINNING_ROOM)
    (on headphones BATHROOM)
    (on laptop ENTRANCE)
    
)
(:goal (and
            ; transportation tasks
            (on crackers BATHROOM)
            (on coke LAUNDRY_ROOM)
            (on milk DINNING_ROOM)
            (on cake KITCHEN)
            (on banana KITCHEN)
            (on hair_spray BATHROOM)
            (on pen BEDROOM)
            (on juice KITCHEN)
            (on tuna DINNING_ROOM)
            (on napkin LAUNDRY_ROOM)
            (on photo BEDROOM)
            (on headphones LAUNDRY_ROOM)
            (on laptop DINNING_ROOM)
        )
)
(:metric minimize (total-cost))
)
