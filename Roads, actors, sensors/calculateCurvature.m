% Get waypoints from scenario
% waypointsL = data.ActorSpecifications.Waypoints;
waypointsL = [4.2 98.2 0;
    39.9 98.3 0;
    50.6 98.7 0.3;
    108.3 68.6 0.4;
    129.7 0.7 0.4;
    109.1 -66.2 0.3;
    49.8 -98.2 0.2;
    40.4 -97.7 0;
    0.1 -98 0;
    -39.6 -97.7 0;
    -49.8 -97.3 0.1;
    -109.7 -64.3 0.2;
    -127.5 0 0.1;
    -110.6 63.8 0.2;
    -50 98.5 0.2;
    -39.5 98.5 0;
    0.2 98.5 0];
%waypointsL = data.ActorSpecifications.Waypoints;
waypointsL = waypointsL(:,1:2);

% Generate a reference path from a set of waypoints
refPathL = referencePathFrenet(waypointsL);

% Create a trajectoryGeneratorFrenet object from the reference path
connectorL = trajectoryGeneratorFrenet(refPathL);

% Display the trajectory in global coordinates.
show(refPathL);

% Get trajectory length
length = refPathL.PathLength;

% Return curvature at arclength 10, 20, 24, 50
for i = 1:length
kappaL(i) = curvature(refPathL, [i]);
end
