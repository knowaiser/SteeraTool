clear;
%waypoints = data.ActorSpecifications.Waypoints;
x2 = sin(linspace(0,2*pi));
y2 = cos(linspace(0,3*pi));
X = [x2',y2'];
%X = waypoints(:,1:2);
[L2,R2,K2] = curvature(X);
figure;
plot(L2,R2)
title('Curvature radius vs. cumulative curve length')
xlabel L
ylabel R
figure;
h = plot(x2,y2); grid on; axis equal
set(h,'marker','.');
xlabel x
ylabel y
title('2D curve with curvature vectors')
hold on
%quiver(x2',y2',K2(:,1),K2(:,2));
quiver(waypoints(:,1),waypoints(:,2),K2(:,1),K2(:,2));
hold off

% To draw the vehicle trajectory
%figure;
%plot(waypoints(:,1),waypoints(:,2))
%title('Waypoints')
%xlabel X
%ylabel Y