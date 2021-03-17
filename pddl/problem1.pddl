(define (problem guide1)
  ;; your trolley already holds the food
  ;; take it to the tiger
  (:domain mudd-guider)
  (:objects
    ;; Directions
    north-directly - direction
    northwest-directly - direction
    west-directly - direction
    southwest-directly - direction
    south-directly - direction
    southeast-directly - direction
    east-directly - direction
    northeast-directly - direction

    ;; User
    u - user

    ;; Map locations
    gate1 - gate
    gate2 - gate
    gate3 - gate
    gate4 - gate
    gate5 - gate
    gate6 - gate
    gate7 - gate
    main-entrance - gate
    path1 - path
    path2 - path
    path3 - path
    path4 - path
    path5 - path
    path6 - path
    path7 - path
    path8 - path
    path9 - path
    staircase1 - room
    staircase2 - room
    staircase3 - room
    elevator1 - room
    elevator2 - room
    lactation-room - room
    restroom - room
    northwestern-it-research-computing-services - room
    classroom-2210 - room
    classroom-2124 - room
    maker-lab - room
    gis-lab - room
    meeting-room-2141 - room
    meeting-room-2135 - room
    meeting-room-2142 - room
    meeting-room-2133 - room
    meeting-room-2144 - room
    meeting-room-2146 - room
    meeting-room-2148 - room
    meeting-room-2151 - room
    meeting-room-2153 - room
    meeting-room-2155 - room
    meeting-room-2174 - room
    meeting-room-2176 - room
    video-production-studio - room
    checkout-location - room
    lockers - space
    south-study-lounge - space
    north-study-lounge - space
    printers - space
    astrahan-information-center - room
    east-commons - space
    vending-machine - space
  )

  (:init
    ;;;;;;;;;; Map Encodng ;;;;;;;;;;

    ;; Paths <-> paths
    (adjacent path2 path3 West-Directly)
    (adjacent path3 path4 North-Directly)
    (adjacent path4 path7 West-Directly)
    (adjacent path5 path6 North-Directly)
    (adjacent path5 path9 North-Directly)

    ;; Paths <-> gates
    (adjacent gate1 path1 North-Directly)
    (adjacent path1 gate2 North-Directly)
    (adjacent gate2 path2 North-Directly)
    (adjacent path2 gate3 North-Directly)
    (adjacent path4 gate4 East-Directly)
    (adjacent path4 gate5 West-Directly)
    (adjacent path4 gate6 North-Directly)
    (adjacent path7 gate6 North-Directly)
    (adjacent path7 main-entrance South-Directly)
    (adjacent path6 main-entrance West-Directly)
    (adjacent path5 gate4 West-Directly)
    (adjacent path8 gate7 West-Directly)

    ;; Paths <-> rooms
    (adjacent path2 staircase1 West-Directly)
    (adjacent path3 elevator1 South-Directly)
    (adjacent path3 restroom South-Directly)
    (adjacent path3 northwestern-it-research-computing-services South-Directly)
    (adjacent path3 classroom-2210 South-Directly)
    (adjacent path5 meeting-room-2142 South-Directly)
    (adjacent path5 meeting-room-2133 South-Directly)
    (adjacent path5 meeting-room-2144 North-Directly)
    (adjacent path5 classroom-2124 South-Directly)
    (adjacent path5 maker-lab South-Directly)
    (adjacent path5 gis-lab South-Directly)
    (adjacent path6 checkout-location East-Directly)
    (adjacent path7 elevator2 South-Directly)
    (adjacent path7 staircase3 South-Directly)
    (adjacent path8 meeting-room-2174 East-Directly)
    (adjacent path8 meeting-room-2176 East-Directly)
    (adjacent path8 staircase2 North-Directly)
    (adjacent path8 video-production-studio West-Directly)

    ;; Paths <-> spaces
    (adjacent path2 vending-machine East-Directly)
    (adjacent path5 astrahan-information-center South-Directly)
    (adjacent path5 south-study-lounge East-Directly)
    (adjacent path6 printers West-Directly)
    (adjacent path8 north-study-lounge North-Directly)
    (adjacent path8 east-commons South-Directly)
    (adjacent path9 east-commons North-Directly)

    ;; Gates <-> gates
    ;; None

    ;; Gates <-> rooms
    ;; None

    ;; Gates <-> spaces
    (adjacent gate3 south-study-lounge North-Directly)
    (adjacent gate6 north-study-lounge North-Directly)

    ;; Rooms <-> rooms
    (adjacent staircase1 lactation-room West-Directly)
    (adjacent staircase1 elevator1 West-Directly)
    (adjacent restroom lactation-room East-Directly)
    (adjacent restroom elevator1 East-Directly)
    (adjacent restroom northwestern-it-research-computing-services West-Directly)
    (adjacent northwestern-it-research-computing-services classroom-2210 West-Directly)
    (adjacent classroom-2124 maker-lab West-Directly)
    (adjacent maker-lab gis-lab West-Directly)

    (adjacent meeting-room-2141 meeting-room-2135 West-Directly)
    (adjacent meeting-room-2141 meeting-room-2142 North-Directly)
    (adjacent meeting-room-2142 meeting-room-2133 West-Directly)
    (adjacent meeting-room-2135 meeting-room-2133 North-Directly)

    (adjacent meeting-room-2144 meeting-room-2146 North-Directly)
    (adjacent meeting-room-2146 meeting-room-2148 North-Directly)
    (adjacent meeting-room-2148 meeting-room-2151 West-Directly)
    (adjacent meeting-room-2151 meeting-room-2153 West-Directly)
    (adjacent meeting-room-2153 meeting-room-2155 West-Directly)

    (adjacent meeting-room-2174 meeting-room-2176 North-Directly)

    ;; Rooms <-> spaces
    (adjacent south-study-lounge meeting-room-2141 West-Directly)
    (adjacent south-study-lounge meeting-room-2142 West-Directly)
    (adjacent south-study-lounge meeting-room-2144 West-Directly)
    (adjacent south-study-lounge meeting-room-2146 West-Directly)
    (adjacent south-study-lounge meeting-room-2148 West-Directly)

    (adjacent east-commons meeting-room-2148 South-Directly)
    (adjacent east-commons meeting-room-2151 South-Directly)
    (adjacent east-commons meeting-room-2153 South-Directly)
    (adjacent east-commons meeting-room-2155 South-Directly)

    (adjacent north-study-lounge staircase2 East-Directly)

    ;; Spaces <-> spaces
    (adjacent south-study-lounge east-commons Northwest-Directly)
    (adjacent south-study-lounge lockers West-Directly)

    ;; Room occupation
    ;; TODO FINSIH
    (is-occupied meeting-room-2141)
    (nearest-unoccupied meeting-room-2141 meeting-room-2135)

    (is-occupied meeting-room-2142)
    (nearest-unoccupied meeting-room-2142 meeting-room-2133)

    (is-occupied meeting-room-2144)
    (nearest-unoccupied meeting-room-2144 meeting-room-2146)


    ;;;;;;;;;; User Start ;;;;;;;;;;
    (user-at u path2)
    (in-room u)
    (user-face u north-directly)
    (user-target u path4)
  )
  (:goal
    ;;;;;;;;;; User Goal ;;;;;;;;;;
    (at-target u)
  )
)