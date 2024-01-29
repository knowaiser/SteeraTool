function [scenario, egoVehicle] = Oval_edited_clock()
% createDrivingScenario Returns the drivingScenario defined in the Designer

% Generated by MATLAB(R) 9.14 (R2023a) and Automated Driving Toolbox 3.7 (R2023a).
% Generated on: 05-Oct-2023 12:59:24

% Construct a drivingScenario object.
scenario = drivingScenario;

% Add all road segments
roadCenters = [0 -100 0;
    40 -100 0;
    49 -100 0.45;
    50 -100 0.45;
    130 0 0.45;
    50 100 0.45;
    49 100 0.45;
    40 100 0;
    -40 100 0;
    -49 100 0.45;
    -50 100 0.45;
    -130 0 0.45;
    -50 -100 0.45;
    -49 -100 0.45;
    -40 -100 0;
    0 -100 0];

laneSpecification = lanespec(2);
road(scenario, roadCenters, 'Lanes', laneSpecification, 'Name', 'Road');

% Add the ego vehicle
egoVehicle = vehicle(scenario, ...
    'ClassID', 1, ...
    'Position', [2.3 97.8 0], ...
    'Mesh', driving.scenario.carMesh, ...
    'Name', 'Car');
waypoints = [2.3 97.8 0;
    47.4 98 0.2;
    65.2 96.6 0.2;
    82 89.9 0.2;
    98.4 78 0.2;
    110.5 63.5 0.2;
    119.9 45.8 0.2;
    125.4 29.2 0.3;
    128.2 0.1 0.2;
    127 -19.8 0.2;
    122.3 -39.9 0.2;
    116.3 -53.7 0.2;
    108.2 -67.2 0.2;
    99.1 -77.4 0.2;
    86.6 -87 0.2;
    71.3 -94.6 0.2;
    56.1 -97.8 0.2;
    25.6 -98 0;
    -24 -97.9 0;
    -53.6 -97.9 0.2;
    -68.9 -95.1 0.2;
    -83.5 -89.2 0.2;
    -94.69 -81.41 0.23;
    -109.12 -65.63 0.22;
    -117.9 -50.1 0.2;
    -122.8 -37.4 0.2;
    -126.7 -18.4 0.2;
    -128 -6.4 0.2;
    -127.7 9.3 0.2;
    -125.6 26.9 0.2;
    -117.7 50.8 0.2;
    -108.9 65.3 0.2;
    -98.5 78 0.2;
    -86.1 87.8 0.3;
    -77.3 92.5 0.3;
    -62.6 97.3 0.3;
    -47 98.5 0.2;
    3.7 98 0];
speed = [30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30];
jerk = 0.1;
smoothTrajectory(egoVehicle, waypoints, speed, 'Jerk', jerk);

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