(define (problem p1)
(:domain gpsr_domain_w_cost)
(:objects

    ; robots
    mbot - robot
    
    ; locations
    ENTRANCE BEDROOM KITCHEN DINNING_ROOM BATHROOM - location
    LAUNDRY_ROOM CORRIDOR - location

    ; person
    pedro maria diogo salvador monica david sarah - person
    mike charly niel watson mason lucy carlos minh - person
    raphael james bond susy gerhard ploeger katy - person
    stephan luis sagres jose rodrigo mithun abe al - person
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
    (at_p pedro ENTRANCE)
    (at_p maria KITCHEN)
    (at_p diogo KITCHEN)
    (at_p salvador BEDROOM)
    (at_p monica DINNING_ROOM)
    (at_p david ENTRANCE)
    (at_p sarah LAUNDRY_ROOM)
    (at_p mike DINNING_ROOM)
    (at_p charly BEDROOM)
    (at_p niel BATHROOM)
    (at_p watson KITCHEN)
    (at_p mason LAUNDRY_ROOM)
    (at_p lucy ENTRANCE)
    (at_p carlos DINNING_ROOM)
    (at_p minh CORRIDOR)
    (at_p raphael KITCHEN)
    (at_p james CORRIDOR)
    (at_p susy LAUNDRY_ROOM)
    (at_p gerhard BEDROOM)
    (at_p ploeger CORRIDOR)
    (at_p katy ENTRANCE)
    (at_p stephan BATHROOM)
    (at_p luis KITCHEN)
    (at_p sagres BEDROOM)
    (at_p jose DINNING_ROOM)
    (at_p rodrigo CORRIDOR)
    (at_p mithun LAUNDRY_ROOM)
    (at_p abe KITCHEN)
    (at_p al CORRIDOR)
    
    ;ENTRANCE BEDROOM KITCHEN DINNING_ROOM BATHROOM - location
    ;LAUNDRY_ROOM CORRIDOR - location
)
(:goal (and
            ; transportation tasks
            (at_p pedro BATHROOM)
            (at_p maria LAUNDRY_ROOM)
            (at_p diogo DINNING_ROOM)
            (at_p salvador BATHROOM)
            (at_p monica LAUNDRY_ROOM)
            (at_p david KITCHEN)
            (at_p sarah CORRIDOR)
            (at_p mike ENTRANCE)
            (at_p charly CORRIDOR)
            (at_p niel ENTRANCE)
            (at_p watson BATHROOM)
            (at_p mason DINNING_ROOM)
            (at_p lucy KITCHEN)
            (at_p carlos BEDROOM)
            (at_p minh BEDROOM)
            (at_p raphael CORRIDOR)
            (at_p james LAUNDRY_ROOM)
            (at_p susy DINNING_ROOM)
            (at_p gerhard BATHROOM)
            (at_p ploeger ENTRANCE)
            (at_p katy BEDROOM)
            (at_p stephan KITCHEN)
            (at_p luis LAUNDRY_ROOM)
            (at_p sagres CORRIDOR)
            (at_p jose BEDROOM)
            (at_p rodrigo ENTRANCE)
            (at_p mithun DINNING_ROOM)
            (at_p abe BEDROOM)
            (at_p al LAUNDRY_ROOM)
        )
)
(:metric minimize (total-cost))
)
