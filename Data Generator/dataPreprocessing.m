%==========================================================================
% Data preperation for OPTION 1
% States: lateral position, velocity, yaw angle
% Inputs: steering angle
%==========================================================================

% Specify the folder containing the data files
folder = pwd;

% Get a list of all the Excel files in the folder
file_list = dir(fullfile(folder, 'option1_velocity*.xlsx'));

% Initialize the cell array to store the timetables
inputs = cell(1, numel(file_list)); % MD/MV
states = cell(1, numel(file_list)); % Plant output

% Loop over each file and read the data, convert it to a timetable, and add it to the cell array
for i = 1:numel(file_list)
    % Load data from the Excel file
    filename = fullfile(folder, file_list(i).name);
    data_matrix = readmatrix(filename);
    
    % Extract input and output data
    X = data_matrix(:,1:4);
    Y = data_matrix(:,5);
    
    % Convert matrix to timetable
    Time = 0:seconds(0.1):seconds(249.9);
    X_timetable = timetable(X(:,1),X(:,2),X(:,3),...
        'rowtimes',Time);
    Y_timetable = timetable(Y(:,1),...
        'rowtimes',Time);
    
    % Add the timetables to the cell array
    states{i} = X_timetable;
    inputs{i} = Y_timetable;
end

%==========================================================================
% Data preperation for OPTION 2
% States: lateral velocity, yaw angle rate, lateral deviation, relative yaw
% angle
% Inputs: steering angle
%==========================================================================

% Specify the folder containing the data files
folder = pwd;

% Get a list of all the Excel files in the folder
file_list = dir(fullfile(folder, 'option2_velocity*.xlsx'));

% Initialize the cell array to store the timetables
inputs = cell(1, numel(file_list)); % MD/MV
states = cell(1, numel(file_list)); % Plant output

% Loop over each file and read the data, convert it to a timetable, and add it to the cell array
for i = 1:numel(file_list)
    % Load data from the Excel file
    filename = fullfile(folder, file_list(i).name);
    data_matrix = readmatrix(filename);
    
    % Extract input and output data
    X = data_matrix(:,1:5);
    Y = data_matrix(:,6);
    
    % Convert matrix to timetable
    Time = 0:seconds(0.1):seconds(250);
    X_timetable = timetable(X(:,1),X(:,2),X(:,3),X(:,4),...
        X(:,5),...
        'rowtimes',Time);
    Y_timetable = timetable(Y(:,1),...
        'rowtimes',Time);
    
    % Add the timetables to the cell array
    states{i} = X_timetable;
    inputs{i} = Y_timetable;
end

%==========================================================================
% Data preperation for OPTION 3
% States: lateral velocity, yaw angle rate, lateral deviation, relative yaw
% angle
% Inputs: road yaw rate (longitudinal velocity*curvature), steering angle
%==========================================================================

% Specify the folder containing the data files
folder = pwd;

% Get a list of all the Excel files in the folder
file_list = dir(fullfile(folder, 'option3_velocity*.xlsx'));

% Initialize the cell array to store the timetables
inputs = cell(1, numel(file_list)); % MD/MV
states = cell(1, numel(file_list)); % Plant output

% Loop over each file and read the data, convert it to a timetable, and add it to the cell array
for i = 1:numel(file_list)
    % Load data from the Excel file
    filename = fullfile(folder, file_list(i).name);
    data_matrix = readmatrix(filename);
    
    % Extract input and output data
    X = data_matrix(:,1:7);
    Y = data_matrix(:,8);
    
    % Convert matrix to timetable
    Time = 0:seconds(0.1):seconds(250);
    X_timetable = timetable(X(:,1),X(:,2),X(:,3),X(:,4),...
        X(:,5),X(:,6),X(:,7),...
        'rowtimes',Time);
    Y_timetable = timetable(Y(:,1),...
        'rowtimes',Time);
    
    % Add the timetables to the cell array
    states{i} = X_timetable;
    inputs{i} = Y_timetable;
end

%==========================================================================
% Data preperation for OPTION 5
% States x: lateral velocity (Vy), 
%           yaw rate (psi_dot), 
%           global X (X),
%           global Y (Y),
%           yaw angle (psi)
% Inputs u: steering angle
% Outputs dxdt: state derivatives
%==========================================================================

% Specify the folder containing the data files
folder = pwd;

% Get a list of all the Excel files in the folder
file_list = dir(fullfile(folder, 'option5_velocity*.xlsx'));

% Initialize the cell array to store the timetables
inputs = cell(1, numel(file_list)); % MD/MV
states = cell(1, numel(file_list)); % Plant output

% Loop over each file and read the data, convert it to a timetable, and add it to the cell array
for i = 1:numel(file_list)
    % Load data from the Excel file
    filename = fullfile(folder, file_list(i).name);
    data_matrix = readmatrix(filename);
    
    % Extract input and output data
    X = data_matrix(:,1:6);
    Y = data_matrix(:,7);
    
    % Convert matrix to timetable
    Time = 0:seconds(0.1):seconds(250);
    X_timetable = timetable(X(:,2),X(:,3),...
        X(:,4),X(:,5),X(:,6),...
        'rowtimes',Time);
    Y_timetable = timetable(Y(:,1),...
        'rowtimes',Time);
    
    % Add the timetables to the cell array
    states{i} = X_timetable;
    inputs{i} = Y_timetable;
end

%==========================================================================
% Data preperation for OPTION 6 (option 4 flipped)
% States x: steering angle
% Inputs u: lateral velocity (Vy), 
%           yaw rate (psi_dot), 
%           global X (X),
%           global Y (Y),
%           yaw angle (psi)
% Outputs dxdt: steering angle
%==========================================================================

% Specify the folder containing the data files
folder = pwd;

% Get a list of all the Excel files in the folder
file_list = dir(fullfile(folder, 'option5_velocity*.xlsx'));

% Initialize the cell array to store the timetables
inputs = cell(1, numel(file_list)); % MD/MV
states = cell(1, numel(file_list)); % Plant output

% Loop over each file and read the data, convert it to a timetable, and add it to the cell array
for i = 1:numel(file_list)
    % Load data from the Excel file
    filename = fullfile(folder, file_list(i).name);
    data_matrix = readmatrix(filename);
    
    % Extract input and output data
    X = data_matrix(:,1:6);
    Y = data_matrix(:,7);
    
    % Convert matrix to timetable
    Time = 0:seconds(0.1):seconds(250);
    X_timetable = timetable(X(:,2),X(:,3),...
        X(:,4),X(:,6),...
        'rowtimes',Time);
    Y_timetable = timetable(Y(:,1),...
        'rowtimes',Time);
    
    % Add the timetables to the cell array
    states{i} = Y_timetable;
    inputs{i} = X_timetable;
end

%==========================================================================
% Data preperation for OPTION 7
% States x: longitudinal velocity (Vx),
%           yaw angle (psi),
%           yaw rate (psi_dot),
%           global Y (Y),
% Inputs u: steering angle         
% Outputs dxdt: yaw angle (psi),
%               global Y (Y)
%==========================================================================

% Specify the folder containing the data files
%folder = pwd;

% Get a list of all the Excel files in the folder
%file_list = dir(fullfile(folder, 'option5_velocity*.xlsx'));

% Initialize the cell array to store the timetables
% inputs = cell(1, numel(file_list)); % MD/MV
% states = cell(1, numel(file_list)); % Plant output
inputs = cell(1, 1);
states = cell(1, 1);

% Loop over each file and read the data, convert it to a timetable, and add it to the cell array
%for i = 1:numel(file_list)
    % Load data from the Excel file
    filename = 'states_AdaMPC.xlsx';
    data_matrix = readmatrix(filename);
    
    % Extract input and output data
    X = data_matrix(:,3:6);
    U = data_matrix(:,2);
    
    % Convert matrix to timetable
    Time = 0:seconds(0.1):seconds(15);
    X_timetable = timetable(X(:,1),X(:,2),...
        X(:,3),X(:,4),...
        'rowtimes',Time);
    U_timetable = timetable(U(:,1),...
        'rowtimes',Time);
    
    % Add the timetables to the cell array
    states{1} = X_timetable;
    inputs{1} = U_timetable;
end


