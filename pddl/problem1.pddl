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
    classroom_2210 - room
    classroom_2124 - room
    maker-lab - room
    gis-lab - room
    meeting-room_2141 - room
    meeting-room_2135 - room
    meeting-room_2142 - room
    meeting-room_2133 - room
    meeting-room_2144 - room
    meeting-room_2146 - room
    meeting-room_2148 - room
    meeting-room_2151 - room
    meeting-room_2153 - room
    meeting-room_2155 - room
    meeting-room_2174 - room
    meeting-room_2176 - room
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

    ;; NOTE: Generated using the generate_map_encoding.py script
    (adjacent path2 path3 west-directly)
    (adjacent path3 path2 east-directly)
    (adjacent path3 path4 north-directly)
    (adjacent path4 path3 south-directly)
    (adjacent path4 path7 west-directly)
    (adjacent path7 path4 east-directly)
    (adjacent path5 path6 north-directly)
    (adjacent path6 path5 south-directly)
    (adjacent path5 path9 north-directly)
    (adjacent path9 path5 south-directly)
    (adjacent gate1 path1 north-directly)
    (adjacent path1 gate1 south-directly)
    (adjacent path1 gate2 north-directly)
    (adjacent gate2 path1 south-directly)
    (adjacent gate2 path2 north-directly)
    (adjacent path2 gate2 south-directly)
    (adjacent path2 gate3 north-directly)
    (adjacent gate3 path2 south-directly)
    (adjacent path4 gate4 east-directly)
    (adjacent gate4 path4 west-directly)
    (adjacent path4 gate5 west-directly)
    (adjacent gate5 path4 east-directly)
    (adjacent path4 gate6 north-directly)
    (adjacent gate6 path4 south-directly)
    (adjacent path7 gate6 north-directly)
    (adjacent gate6 path7 south-directly)
    (adjacent path7 main-entrance south-directly)
    (adjacent main-entrance path7 north-directly)
    (adjacent path6 main-entrance west-directly)
    (adjacent main-entrance path6 east-directly)
    (adjacent path5 gate4 west-directly)
    (adjacent gate4 path5 east-directly)
    (adjacent path8 gate7 west-directly)
    (adjacent gate7 path8 east-directly)
    (adjacent path2 staircase1 west-directly)
    (adjacent staircase1 path2 east-directly)
    (adjacent path3 elevator1 south-directly)
    (adjacent elevator1 path3 north-directly)
    (adjacent path3 restroom south-directly)
    (adjacent restroom path3 north-directly)
    (adjacent path3 northwestern-it-research-computing-services south-directly)
    (adjacent northwestern-it-research-computing-services path3 north-directly)
    (adjacent path3 classroom_2210 south-directly)
    (adjacent classroom_2210 path3 north-directly)
    (adjacent path3 meeting-room_2135 north-directly)
    (adjacent meeting-room_2135 path3 south-directly)
    (adjacent path5 meeting-room_2142 south-directly)
    (adjacent meeting-room_2142 path5 north-directly)
    (adjacent path5 meeting-room_2133 south-directly)
    (adjacent meeting-room_2133 path5 north-directly)
    (adjacent path5 meeting-room_2144 north-directly)
    (adjacent meeting-room_2144 path5 south-directly)
    (adjacent path5 classroom_2124 south-directly)
    (adjacent classroom_2124 path5 north-directly)
    (adjacent path5 maker-lab south-directly)
    (adjacent maker-lab path5 north-directly)
    (adjacent path5 gis-lab south-directly)
    (adjacent gis-lab path5 north-directly)
    (adjacent path6 checkout-location east-directly)
    (adjacent checkout-location path6 west-directly)
    (adjacent path7 elevator2 south-directly)
    (adjacent elevator2 path7 north-directly)
    (adjacent path7 staircase3 south-directly)
    (adjacent staircase3 path7 north-directly)
    (adjacent path8 meeting-room_2174 east-directly)
    (adjacent meeting-room_2174 path8 west-directly)
    (adjacent path8 meeting-room_2176 east-directly)
    (adjacent meeting-room_2176 path8 west-directly)
    (adjacent path8 staircase2 north-directly)
    (adjacent staircase2 path8 south-directly)
    (adjacent path8 video-production-studio west-directly)
    (adjacent video-production-studio path8 east-directly)
    (adjacent path2 vending-machine east-directly)
    (adjacent vending-machine path2 west-directly)
    (adjacent path5 astrahan-information-center south-directly)
    (adjacent astrahan-information-center path5 north-directly)
    (adjacent path5 south-study-lounge east-directly)
    (adjacent south-study-lounge path5 west-directly)
    (adjacent path6 printers west-directly)
    (adjacent printers path6 east-directly)
    (adjacent path8 north-study-lounge north-directly)
    (adjacent north-study-lounge path8 south-directly)
    (adjacent path8 east-commons south-directly)
    (adjacent east-commons path8 north-directly)
    (adjacent path9 east-commons north-directly)
    (adjacent east-commons path9 south-directly)
    (adjacent gate3 south-study-lounge north-directly)
    (adjacent south-study-lounge gate3 south-directly)
    (adjacent gate6 north-study-lounge north-directly)
    (adjacent north-study-lounge gate6 south-directly)
    (adjacent staircase1 lactation-room west-directly)
    (adjacent lactation-room staircase1 east-directly)
    (adjacent staircase1 elevator1 west-directly)
    (adjacent elevator1 staircase1 east-directly)
    (adjacent restroom lactation-room east-directly)
    (adjacent lactation-room restroom west-directly)
    (adjacent restroom elevator1 east-directly)
    (adjacent elevator1 restroom west-directly)
    (adjacent restroom northwestern-it-research-computing-services west-directly)
    (adjacent northwestern-it-research-computing-services restroom east-directly)
    (adjacent northwestern-it-research-computing-services classroom_2210 west-directly)
    (adjacent classroom_2210 northwestern-it-research-computing-services east-directly)
    (adjacent classroom_2124 maker-lab west-directly)
    (adjacent maker-lab classroom_2124 east-directly)
    (adjacent maker-lab gis-lab west-directly)
    (adjacent gis-lab maker-lab east-directly)
    (adjacent meeting-room_2141 meeting-room_2135 west-directly)
    (adjacent meeting-room_2135 meeting-room_2141 east-directly)
    (adjacent meeting-room_2141 meeting-room_2142 north-directly)
    (adjacent meeting-room_2142 meeting-room_2141 south-directly)
    (adjacent meeting-room_2142 meeting-room_2133 west-directly)
    (adjacent meeting-room_2133 meeting-room_2142 east-directly)
    (adjacent meeting-room_2135 meeting-room_2133 north-directly)
    (adjacent meeting-room_2133 meeting-room_2135 south-directly)
    (adjacent meeting-room_2144 meeting-room_2146 north-directly)
    (adjacent meeting-room_2146 meeting-room_2144 south-directly)
    (adjacent meeting-room_2146 meeting-room_2148 north-directly)
    (adjacent meeting-room_2148 meeting-room_2146 south-directly)
    (adjacent meeting-room_2148 meeting-room_2151 west-directly)
    (adjacent meeting-room_2151 meeting-room_2148 east-directly)
    (adjacent meeting-room_2151 meeting-room_2153 west-directly)
    (adjacent meeting-room_2153 meeting-room_2151 east-directly)
    (adjacent meeting-room_2153 meeting-room_2155 west-directly)
    (adjacent meeting-room_2155 meeting-room_2153 east-directly)
    (adjacent meeting-room_2174 meeting-room_2176 north-directly)
    (adjacent meeting-room_2176 meeting-room_2174 south-directly)
    (adjacent south-study-lounge meeting-room_2141 west-directly)
    (adjacent meeting-room_2141 south-study-lounge east-directly)
    (adjacent south-study-lounge meeting-room_2142 west-directly)
    (adjacent meeting-room_2142 south-study-lounge east-directly)
    (adjacent south-study-lounge meeting-room_2144 west-directly)
    (adjacent meeting-room_2144 south-study-lounge east-directly)
    (adjacent south-study-lounge meeting-room_2146 west-directly)
    (adjacent meeting-room_2146 south-study-lounge east-directly)
    (adjacent south-study-lounge meeting-room_2148 west-directly)
    (adjacent meeting-room_2148 south-study-lounge east-directly)
    (adjacent east-commons meeting-room_2148 south-directly)
    (adjacent meeting-room_2148 east-commons north-directly)
    (adjacent east-commons meeting-room_2151 south-directly)
    (adjacent meeting-room_2151 east-commons north-directly)
    (adjacent east-commons meeting-room_2153 south-directly)
    (adjacent meeting-room_2153 east-commons north-directly)
    (adjacent east-commons meeting-room_2155 south-directly)
    (adjacent meeting-room_2155 east-commons north-directly)
    (adjacent north-study-lounge staircase2 east-directly)
    (adjacent staircase2 north-study-lounge west-directly)
    (adjacent south-study-lounge east-commons northwest-directly)
    (adjacent east-commons south-study-lounge southeast-directly)
    (adjacent south-study-lounge lockers west-directly)
    (adjacent lockers south-study-lounge east-directly)

    ;; Room occupation
    (is-occupied meeting-room_2141)
    (nearest-unoccupied meeting-room_2141 meeting-room_2135)

    (is-occupied meeting-room_2142)
    (nearest-unoccupied meeting-room_2142 meeting-room_2133)

    (is-occupied meeting-room_2144)
    (nearest-unoccupied meeting-room_2144 meeting-room_2146)

    ;;;;;;;;;; User Start ;;;;;;;;;;
    (user-face u north-directly)

    ;; MODIFY START AND END LOCATION HERE
    (user-at u gate1)
    (user-target u gate1)
  )
  (:goal
    ;;;;;;;;;; User Goal ;;;;;;;;;;
    (at-target u)
  )
)