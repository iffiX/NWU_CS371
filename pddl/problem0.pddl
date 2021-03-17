(define (problem guide0)


  (:domain mudd-guider)
  (:objects
    u - user
    source - region
    int - region
    target - region
  )

  (:init
    (adjacent source int)
    (adjacent int target)
    
    (at u source)
  )

  (:goal
    (at u target)
  )
)