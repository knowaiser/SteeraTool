function [scenario, egoVehicle] = Zigzag()
% createDrivingScenario Returns the drivingScenario defined in the Designer

% Generated by MATLAB(R) 9.9 (R2020b) and Automated Driving Toolbox 3.2 (R2020b).
% Generated on: 30-Nov-2020 12:54:06

% Construct a drivingScenario object.
scenario = drivingScenario;

roadCenters = [91.5 57.4 0;
    73.8 -58.4 0;
    31.6 51.2 0;
    14.9 -54.4 0;
    -8.7 54.3 0;
    -39.8 -49 0;
    -47.1 56.9 0];
laneSpecification = lanespec(3);
road(scenario, roadCenters, 'Lanes', laneSpecification, 'Name', 'Road');

egoVehicle = vehicle(scenario, ...
    'ClassID', 1, ...
    'Position', [88.5 58 0], ...
    'Mesh', driving.scenario.carMesh, ...
    'Name', 'Car');
waypoints = [88.5 58 0;
    110.7 38.7 0;
    123.2 20 0;
    130.4 5.5 0;
    136.1 -9 0;
    136.7 -26.2 0;
    127.3 -54.2 0;
    113.3 -68.2 0;
    90.5 -70.8 0;
    75.9 -64.1 0;
    67.6 -48 0;
    63.5 -23.1 0;
    67.6 5.5 0;
    65 23.1 0;
    58.3 47 0;
    42.2 56.4 0;
    23 47.5 0;
    17.8 21.1 0;
    25.6 -2.3 0;
    32.3 -18.9 0;
    31.3 -45.4 0;
    19.3 -54.7 0;
    3.2 -52.6 0;
    -6.6 -39.1 0;
    -7.1 -15.8 0;
    0.6 9.1 0;
    7.4 33 0;
    4.8 50.1 0;
    -10.8 53.8 0;
    -28.4 52.7 0;
    -33.6 42.4 0;
    -39.8 19.5 0;
    -35.7 7.1 0;
    -33.6 -9 0;
    -31.5 -24.6 0;
    -33.1 -37.1 0;
    -38.3 -48 0;
    -47.6 -55.8 0;
    -59.6 -58.9 0;
    -73.1 -56.8 0;
    -87.1 -46.9 0;
    -96.9 -30.8 0;
    -97.5 -15.3 0;
    -94.9 4.5 0;
    -84 22.1 0;
    -68.4 39.2 0;
    -55.9 51.2 0;
    -47.6 57.4 0];
speed = 15;
trajectory(egoVehicle, waypoints, speed);


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
