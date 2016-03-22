; author Oscar Lima : olima_84@yahoo.com
; Youbot BTT domain, used for transportation tasks
; This domain can be used for robocup@work competition
; http://www.robocupatwork.org/
; license : GPLv3

(define (domain yb_general_domain)
 (:requirements :typing :action-costs)
 (:types
        location                ; service areas, points of interest, navigation goals
        robot                   ; your amazing yet powerful robot
        object                          ; objects to be manipulated by the robot
        gripper                         ; robot gripper
        robot_platform          ; platform slots for the robot to store objects
 )

 (:predicates

        ; robot ?r is at location ?l
        (at ?r - robot ?l - location)

        ; object ?o is on location ?l
        (on ?o - object ?l - location)

        ; object ?o is stored on robot platform ?rp
        (stored ?o - object ?rp - robot_platform)

        ; robot platform ?rp is occupied, yb has 3 free places to store objects
        (occupied ?rp - robot_platform)

        ; gripper ?g is holding object ?o
        (holding ?g - gripper ?o - object)

        ; gripper ?g is free (does not contain object)
        (gripper_is_free ?g - gripper)

        ; an object ?o is perceived when object recognition was triggered
        ; gets lost if the robot moves the base
        (perceived ?l - location)
 )

 (:functions
        (total-cost) - number
 )

; moves a robot ?r from ?source - location to a ?destination - location
; NOTE : the situation in which the robot arm is in any position before moving
; is not handled at the planning level, hence we advise to always move the arm
; to a folded position, then navigate
 (:action move_base_safe
     :parameters (?source ?destination - location ?r - robot ?g - gripper)
     :precondition (and (at ?r ?source)
                                        (gripper_is_free ?g)
                           )
     :effect (and (not (at ?r ?source))
                          (at ?r ?destination)
                          (not (perceived ?destination))
                          (not (perceived ?source))
