            )
  )

  ; manipulation action
  ; i.e. grasp the energy drink
  (:action grasp
    :parameters (?obj - object ?l - location ?r - robot)
    :precondition (and (at_r ?r ?l) (on ?obj ?l) (not (holding ?obj ?r)) (gripper_empty ?r))
    :effect (and (holding ?obj ?r) (not (gripper_empty ?r)) (increase (total-cost) 1))
  )

  ; manipulation action
  ; having an object already in the gripper place it on a surface in front of the robot
  ; i.e. place the pringles on the table
  (:action place
    :parameters (?obj - object ?l - location ?r - robot)
    :precondition (and (at_r ?r ?l) (on ?obj ?l) (holding ?obj ?r) (not (gripper_empty ?r)))
    :effect (and (not (holding ?obj ?r)) (gripper_empty ?r) (increase (total-cost) 1))
  )

  ; perception action
  ; i.e. find a person
  (:action find_person
    :parameters (?p - person ?l - location ?r - robot)
    :precondition (and (at_r ?r ?l) (at_p ?p ?l))
    :effect (and (found ?p) (increase (total-cost) 1))
  )

  ; HRI action
  ; i.e. go to the kitchen, find a person and introduce yourself
  (:action introduce
    :parameters (?r - robot ?p - person ?l - location)
    :precondition (and (at_p ?p ?l) (at_r ?r ?l) (found ?p))
    :effect (and (known_p ?r ?p) (increase (total-cost) 1))
  )

  ; HRI - Navigation action
  ; i.e. find a person and guide it to the exit
  (:action guide
    :parameters (?p - person ?source ?destination - location ?r - robot)
    :precondition (and (at_p ?p ?source) (at_r ?r ?source) (found ?p))
    :effect (and (at_p ?p ?destination) (at_r ?r ?destination)
                 (not (at_p ?p ?source)) (not (at_r ?r ?source)) (increase (total-cost) 500))
  )

  ; HRI action
  ; i.e. what time is it?
  (:action answer_question
    :parameters (?p - person ?l - location ?r - robot)
    :precondition (and (puzzled ?p) (at_p ?p ?l) (at_r ?r ?l) (found ?p))
    :effect (and (iluminated ?p) (increase (total-cost) 1))
  )

  ; HRI action
  (:action ask_name
    :parameters (?p - person ?l - location ?r - robot)
    :precondition (and (at_p ?p ?l) (at_r ?r ?l) (found ?p))
    :effect (and (known_r ?p ?r) (increase (total-cost) 1))
  )
)