scenario = drivingScenario;

% transpose waypoints so they visually align with bank angles below
roadCenters = ...
    [  0  40  49  50 100  50  49 40 -40 -49 -50 -100  -50  -49  -40    0
     -50 -50 -50 -50   0  50  50 50  50  50  50    0  -50  -50  -50  -50
       0   0 .45 .45 .45 .45 .45  0   0 .45 .45  .45  .45  .45    0    0]';
bankAngles = ...
    [  0   0   9   9   9   9   9  0   0   9   9    9    9    9    0    0];

road(scenario, roadCenters, bankAngles, 'lanes', lanespec(2));
plot(scenario,'RoadCenters','on');
view(-60,20)

drivingScenarioDesigner(scenario)