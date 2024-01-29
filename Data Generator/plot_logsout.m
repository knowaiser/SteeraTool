st = logsout.get("steering_angle").Values;

time_data = st.Time;
steering_data = st.Data;

figure;
plot(time_data, steering_data);
xlabel('Time (s)');
ylabel('Steering Angle (degrees or radians)');  % Use appropriate units
title('Steering Angle vs. Time');
grid on;


element = logsout.getElement("lane_detections");
lane_boundary = element.Values.LaneBoundaries(1);
heading_angle = lane_boundary.HeadingAngle;
ha = heading_angle.Data;