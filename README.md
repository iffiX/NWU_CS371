# NWU_CS371
To run our planner with different inputs, follow these steps…

1. Go to this link with our domain and planning file pre-loaded. http://editor.planning.domains/#edit_session=N6GyiPNeNOJZWMO

2. If that link does not open or the domain.pddl and problem.pddl files are missing, go to this link: http://editor.planning.domains/# then click File > Load and choose the domain.pddl file from the pddl directory in our project. Do this again for the problem.pddl file.

3. Now that the files are loaded into the editor, click Solve. Ensure the domain.pddl and problem.pddl files are selected appropriately and click Plan.

4. The plan can now be viewed under the Plan (I) tab.

5. To run this planner for different start and end locations, go to the bottom of problem.pddl and edit the following lines…
;; MODIFY START AND END LOCATION HERE
(user-at u gate1)
(user-target u maker-lab)

The last argument in user-at (gate1) is the start location and the last argument for user-target (maker-lab) is the destination. Change these with any of the following locations: gate1, gate2, gate3, gate4, gate5, gate6, gate7, main-entrance, path1, path2, path3, path4, path5, path6, path7, path8, path9, staircase1, staircase2, staircase3, elevator1, elevator2, lactation-room, restroom, northwestern-it-research-computing-services, classroom_2210, classroom_2124, maker-lab, gis-lab, meeting-room_2141, meeting-room_2135, meeting-room_2142, meeting-room_2133, meeting-room_2144 - room, meeting-room_2146, meeting-room_2148, meeting-room_2151, meeting-room_2153, meeting-room_2155, meeting-room_2174, meeting-room_2176, video-production-studio, checkout-location, lockers, south-study-lounge, north-study-lounge, printers, astrahan-information-center - room, east-commons, vending-machine

Specifically try the following start: gate1, and target: meeting-room_2141
This route uses every action in the system since the target is occupied, you can see the first step of the plan was to change the target to an unoccupied location.
