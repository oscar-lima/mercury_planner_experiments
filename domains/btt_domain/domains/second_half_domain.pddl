             )
 )

 ; perceive an object ?o which is in a location ?l with a empty gripper ?g
 ; to find the pose of this object before it can be picked
 (:action perceive_location
   :parameters (?l - location ?r - robot ?g - gripper)
   :precondition    (and    (at ?r ?l)
                                    ;(on ?o ?l) ; add ?o - object if you uncomment this line
                                    (gripper_is_free ?g)
                                    (not (perceived ?l))
                          )
   :effect  (and    (perceived ?l)
                    ;(increase (total-cost) (perception-complexity ?o))
                    (increase (total-cost) 1)
            )
 )

 ; pick an object ?o which is inside a location ?l with a free gripper ?g
 ; with robot ?r that is at location ?l
 (:action pick
     :parameters (?o - object ?l - location ?r - robot ?g - gripper)
     :precondition  (and    (on ?o ?l)
                            (at ?r ?l)
                            (perceived ?l)
                            (gripper_is_free ?g)
                            (not (holding ?g ?o))
                    )
     :effect (and   (holding ?g ?o)
                    (not (on ?o ?l))
                    (not (gripper_is_free ?g))
                    (holding ?g ?o)
                    (increase (total-cost) 1)
             )
 )

 (:action place
     :parameters (?o - object ?l - location ?r - robot ?g - gripper)
     :precondition  (and  (at ?r ?l)
                          (holding ?g ?o)
                          (not (on ?o ?l))
                          (not (perceived ?l)) ;under testing, not really required
                          (not (gripper_is_free ?g))
                    )
     :effect (and   (on ?o ?l)
                    (not (holding ?g ?o))
                    (gripper_is_free ?g)
                    (increase (total-cost) 1)
             )
 )


 ; stage an object ?o in a robot platform ?rp which is not occupied with a gripper ?g
 ; which is holding the object ?o
 (:action stage
     :parameters (?o - object ?rp - robot_platform ?g - gripper)
     :precondition  (and    (holding ?g ?o)
                            (not (occupied ?rp))
                            (not (gripper_is_free ?g))
                    )
     :effect (and   (not (holding ?g ?o))
                              (gripper_is_free ?g)
                          (stored ?o ?rp)
                    (occupied ?rp)
                    (increase (total-cost) 1)
             )
 )

 ; unstage an object ?o stored on a robot platform ?rp with a free gripper ?g
 (:action unstage
     :parameters (?o - object ?rp - robot_platform ?g - gripper)
     :precondition  (and    (gripper_is_free ?g)
                            (stored ?o ?rp)
                            (not (holding ?g ?o))
                    )
     :effect (and   (not (gripper_is_free ?g))
                          (not (stored ?o ?rp))
                    (not (occupied ?rp))
                    (holding ?g ?o)
                    (increase (total-cost) 1)
             )
 )
)
