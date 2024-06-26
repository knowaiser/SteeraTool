function [scenario, egoVehicle] = L_shaped()
% createDrivingScenario Returns the drivingScenario defined in the Designer

% Generated by MATLAB(R) 9.9 (R2020b) and Automated Driving Toolbox 3.2 (R2020b).
% Generated on: 30-Nov-2020 12:54:06

% Construct a drivingScenario object.
scenario = drivingScenario;

% Add all road segments
roadCenters = [-2 24.4 0;
    33.5 15.7 0];
marking = [laneMarking('Solid', 'Color', [0.98 0.86 0.36])
    laneMarking('Dashed', 'Space', 3)
    laneMarking('Solid')];
laneSpecification = lanespec(2, 'Width', 3.5, 'Marking', marking);
road(scenario, roadCenters, 'Lanes', laneSpecification, 'Name', 'Road');

roadCenters = [27.7 25.7 0;
    27.7 -22.2 0];
marking = [laneMarking('Solid', 'Color', [0.98 0.86 0.36])
    laneMarking('Dashed', 'Space', 3)
    laneMarking('Solid')];
laneSpecification = lanespec(2, 'Width', 3.5, 'Marking', marking);
road(scenario, roadCenters, 'Lanes', laneSpecification, 'Name', 'Road1');

roadCenters = [19.4 -7.3 0;
    53.1 -17.4 0];
marking = [laneMarking('Solid', 'Color', [0.98 0.86 0.36])
    laneMarking('Dashed', 'Space', 3)
    laneMarking('Solid')];
laneSpecification = lanespec(2, 'Width', 3.5, 'Marking', marking);
road(scenario, roadCenters, 'Lanes', laneSpecification, 'Name', 'Road2');


% Add the ego vehicle
egoVehicle = vehicle(scenario, ...
    'ClassID', 1, ...
    'Position', [-3.23363329541974 23.4433517985373 0], ...
    'Mesh', driving.scenario.carMesh, ...
    'Name', 'Car');
waypoints = [-3.23363329541974 23.4433517985373 0;
    6.6 20.8 0;
    14.1 18.9 0;
    21.7 17.2 0;
    24.2 16.4 0;
    25.7 14.4 0;
    25.8 11.5 0;
    25.7 6.2 0;
    25.5 -1.2 0;
    25.5 -8.3 0;
    26.1 -10.9 0;
    28.3 -12 0;
    31.1 -13 0;
    37.5 -14.8 0;
    47.5 -17.5 0;
    52.2 -19 0];
speed = 15;
smoothTrajectory(egoVehicle, waypoints, speed);


% Add the non-ego actors
fastCar = vehicle(scenario, ...
    'ClassID', 1, ...
    'Position', [82.5935654028723 -494.956102047486 0], ...
    'FrontOverhang', 0.9, ...
    'Mesh', driving.scenario.carMesh, ...
    'Name', 'fastCar');
waypoints = [82.5935654028723 -494.956102047486 0;
    109.734171567359 -489.654624802447 0;
    136.541518659389 -482.866082555182 0;
    162.93419364691 -474.611091885378 0;
    188.832042843424 -464.914722928388 0;
    214.156415332095 -453.806423238044 0;
    238.830401826004 -441.319928355416 0;
    262.779068239117 -427.493159355073 0;
    285.929683258652 -412.368107680028 0;
    308.211939227675 -395.99070761511 0;
    329.558165667153 -378.410696786047 0;
    349.903534788967 -359.681465107929 0;
    369.186258375777 -339.859892641797 0;
    387.34777542981 -319.006176851762 0;
    404.332930020679 -297.183649787287 0;
    420.090138792137 -274.458585745834 0;
    434.571547619031 -250.9 0];
speed = 19.4;
trajectory(fastCar, waypoints, speed);
