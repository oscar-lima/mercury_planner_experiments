(define (domain gpsr_domain)

  (:requirements :typing :action-costs)

  (:types
    location  ; service areas, points of interest, navigation goals
    robot     ; your awesome and powerful robot
    object    ; objects to be manipulated by the robot
    person    ; a human being who needs to be conquered
  )

  (:predicates
    ; robot ?r is at location ?l
    (at_r ?r - robot ?l - location)

    ; person ?p is at location ?l
    (at_p ?p - person ?l - location)

    ; object ?obj is on location ?l
    (on ?obj - object ?l - location)

    ; robot ?r is holding object ?obj
    (holding ?obj - object ?r - robot)

    ; the gripper of the robot ?r is free (does not contain any object)
    (gripper_empty ?r - robot)

    ; perception face recognition to find any person
    (found ?p - person)

    ; after robot has introduced himself it becames known to the person
    (known_p ?r - robot ?p - person)

    ; the robot know the person
    (known_r ?r - person ?r - robot)

    ; a person is puzzled and hungry for aswers
    (puzzled ?p)

    ; a person is knowleadgeable now, because his question was answered
    (iluminated ?p)
  )

  (:functions
     (total-cost) - number
  )

  ; navigation action
  ; i.e. move to the hallway table
  (:action move_base
    :parameters (?source ?destination - location ?r - robot)
    :precondition (at_r ?r ?source)
    :effect (and (at_r ?r ?destination) (not (at_r ?r ?source))
              (forall (?obj - object)
                (when (holding ?obj ?r)
                  (and (on ?obj ?destination) (not (on ?obj ?source)) )
                )
              )