function [scenario, egoVehicle] = S_shaped()
% createDrivingScenario Returns the drivingScenario defined in the Designer

% Generated by MATLAB(R) 9.9 (R2020b) and Automated Driving Toolbox 3.2 (R2020b).
% Generated on: 30-Nov-2020 12:54:06

% Construct a drivingScenario object.
scenario = drivingScenario;

% Add all road segments
roadCenters = [5.2 27.4 0;
    36.4 20.6 0;
    35 -19.8 0;
    51.7 -23.1 0];
marking = [laneMarking('Solid', 'Color', [0.98 0.86 0.36])
    laneMarking('Dashed', 'Space', 3)
    laneMarking('Solid')];
laneSpecification = lanespec(2, 'Width', 3.5, 'Marking', marking);
road(scenario, roadCenters, 'Lanes', laneSpecification, 'Name', 'Road');

% Add the ego vehicle
egoVehicle = vehicle(scenario, ...
    'ClassID', 1, ...
    'Position', [2.7 25.3 0], ...
    'Mesh', driving.scenario.carMesh, ...
    'Name', 'Car');
waypoints = [2.7 25.3 0;
    7.6 26.9 0;
    10.4 27.4 0;
    13.9 28.1 0;
    17.2 28.2 0;
    19.8 28.1 0;
    22.5 27.8 0;
    24.6 27.1 0;
    28.7 25.4 0;
    30.3 24.4 0;
    32.4 22.6 0;
    33.8 20.9 0;
    34.5 19.5 0;
    35.1 18.5 0;
    35.5 17.2 0;
    35.9 16.1 0;
    36.1 13.9 0;
    36 12 0;
    35.5 10.5 0;
    35.1 8.7 0;
    34.6 6.4 0;
    33.6 3.7 0;
    32.7 1.3 0;
    32 -1 0;
    31.1 -3 0;
    30.4 -6.1 0;
    29.9 -8.7 0;
    29.7 -11.7 0;
    30.2 -14.9 0;
    31.1 -17.8 0;
    32.4 -19.7 0;
    33.6 -21.2 0;
    35.1 -22.6 0;
    36.8 -23.7 0;
    38.3 -24.6 0;
    40.6 -25 0;
    43.2 -25.2 0;
    45.3 -25.2 0;
    47.3 -25.3 0;
    49.3 -25.3 0;
    51.1 -25.1 0];
speed = 10;
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
