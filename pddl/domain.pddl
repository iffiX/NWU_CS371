(define (domain mudd-guider)
  (:requirements :typing :negative-preconditions :existential-preconditions)

  (:types
    ;; Define direction
    direction

    ;; Define agent
    user - agent
    room path - region
    gate space - path
  )

  (:predicates
    ;; User location and orientation
    (user-at ?u - user ?r - region)
    (user-face ?u - user ?d - direction)
    (in-room ?u - user)

    ;; Spatial relations
    (adjacent ?r1 - region ?r2 - region ?d - direction)

    ;; Room occupation
    (is-occupied ?r - region)
    (nearest-unoccupied ?r1 - region ?r2 - region)

    ;; Destination
    (user-target ?u - user ?r - region)
    (at-target ?u - user)
  )

  ;;;;;;;;;; Actions ;;;;;;;;;;

  ;; Move between paths
  (:action move-path
    :parameters (
      ?u - user
      ?p1 - path
      ?p2 - path
      ?d - direction
      ?t - region
    )

    :precondition (
      and
        ;; Ensure we aren't moving towards an occupied room
        (user-target ?u ?t)
        (not (is-occupied ?t))

        (user-at ?u ?p1)
        (user-face ?u ?d)
        (adjacent ?p1 ?p2 ?d)
    )

    :effect (
      and
        (not (user-at ?u ?p1))
        (user-at ?u ?p2)
    )
  )

  ;; Change user orientation
  (:action user-rotate
    :parameters (
      ?u - user
      ?d1 - direction
      ?d2 - direction
      ?t - region
    )

    :precondition (
      and
        ;; Ensure we aren't moving towards an occupied room
        (user-target ?u ?t)
        (not (is-occupied ?t))

        (user-face ?u ?d1)
    )

    :effect (
      and
        (not (user-face ?u ?d1))
        (user-face ?u ?d2)
    )
  )

  ;; Enter room from adjacent path
  (:action enter-room
    :parameters (
      ?u - user
      ?r - room
      ?p - path
      ?d - direction
      ?t - region
    )

    :precondition (
      and
        ;; Ensure we aren't moving towards an occupied room
        (user-target ?u ?t)
        (not (is-occupied ?t))

        (not (in-room ?u))
        (user-at ?u ?p)
        (user-face ?u ?d)
        (adjacent ?r ?p ?d)
    )

    :effect (
      and
        (in-room ?u)
        (not (user-at ?u ?p))
        (user-at ?u ?r)
    )
  )

  ;; Exit room to adjacent path
  (:action exit-room
    :parameters (
      ?u - user
      ?r - room
      ?p - path
      ?d - direction
      ?t - region
    )

    :precondition (
      and
        ;; Ensure we aren't moving towards an occupied room
        (user-target ?u ?t)
        (not (is-occupied ?t))

        (in-room ?u)
        (user-at ?u ?r)
        (user-face ?u ?d)
        (adjacent ?r ?p ?d)
    )

    :effect (
      and
        (not (in-room ?u))
        (not (user-at ?u ?r))
        (user-at ?u ?p)
    )
  )

  ;; Change target if it is occupied
  (:action change-target
    :parameters (
      ?u - user
      ?r1 - room
      ?r2 - room
    )

    ;; Target reached not set, but user is at it's target destination
    :precondition (
      and
        (user-target ?u ?r1)
        (is-occupied ?r1)
        (nearest-unoccupied ?r1 ?r2)
    )

    ;; User has reached target
    :effect (
      and
        (not (user-target ?u ?r1))
        (user-target ?u ?r2)
    )
  )

  ;; Set arrived at target
  (:action arrive-target
    :parameters (
      ?u - user
      ?r - region
    )

    ;; Target reached not set, but user is at it's target destination
    :precondition (
      and
        (not (at-target ?u))
        (user-at ?u ?r)
        (user-target ?u ?r)
    )

    ;; User has reached target
    :effect (
      and
        (at-target ?u)
    )
  )
)