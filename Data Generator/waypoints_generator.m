scenario = drivingScenario;


roadCenters = ...
    [  0  40  49  50 100  50  49 40 -40 -49 -50 -100  -50  -49  -40    0
     -50 -50 -50 -50   0  50  50 50  50  50  50    0  -50  -50  -50  -50
       0   0 .45 .45 .45 .45 .45  0   0 .45 .45  .45  .45  .45    0    0]';

road(scenario, roadCenters, 'lanes', lanespec(2));
plot(scenario,'RoadCenters','on');
view(-60,20)

% Create random points (and the yaw angles relative to these points)
% The points will be used for start and end positions
numPoints = 10;
setSeed = 2;
rng(setSeed);
s = rng;
%[points,yaw] = helperSamplePositions(scenario,numPoints,"Seed",s, Lanes=1);
[points,yaw] = helperSamplePositions(scenario,numPoints,Lanes=1);

% Create vehicles and assign each vehicle a starting position 
% from the generated random points
numVehicles = 1;
startSet1 = [points(4,:)];
yaw1 = [yaw(4)];
mesh = driving.scenario.carMesh;

% Place vehicles in the selected points by using the vehicle function
for idx = 1 : numVehicles
    vehicle(scenario,Position=startSet1(idx,:),Yaw=yaw1(idx),ClassID=1,Mesh=mesh);
end

startPositions = [startSet1];

% Generate the goal positions
numGoalPositions = length(startPositions);
numPoints2 = 1;
goalSet2 = helperSamplePositions(scenario,numPoints2,Lanes=1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Using the first point in roadCenters as the start position
startPosition = roadCenters(1,:);  % This is the [x,y] coordinate of the starting position

% Using the 6th point in roadCenters as the goal position
goalPosition = roadCenters(6,:);  % This is the [x,y] coordinate of the goal position
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Plot
figure
plot(scenario,Meshes="on"); 
title("Start and Goal Positions")
hold on
plot(startPosition,"ro",MarkerSize=5,MarkerFaceColor="r");
plot(goalPosition, "bo", MarkerSize=5, MarkerFaceColor="b")
%xlim([-50 190])
%ylim([-85 310])
hold off

% Generate waypoints
info = helperGenerateWaypoints(scenario,startPosition,goalPosition);
for indx = 1:1
    vehicleData = scenario.Actors(indx);
    speed = randi([10,25],1,1);
    waypts = info(indx).waypoints;
    trajectory(vehicleData,waypts,speed);
end