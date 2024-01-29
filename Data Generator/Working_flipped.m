%==========================================================================
% Data preperation for OPTION 5
% inputs u: lateral velocity (Vy), 
%           yaw rate (psi_dot), 
%           global X (X),
%           global Y (Y),
%           yaw angle (psi)
% states x: steering angle
% Outputs dxdt: state derivatives
% Units: lateral velocity   [m/s]   
%        yaw rate (psi_dot) [rad/s]
%        global X (X)       [m]
%        global Y (Y)       [m]
%        yaw angle (psi)    [rad]
% Inputs u: steering angle  [rad]
%==========================================================================

close all
clear
clc

% load("data_4states.mat")
load("data_4states.mat")

% Initialize cell arrays for normalized data
inputNormalized = cell(size(inputs));
stateNormalized = cell(size(states));

% Normalize input and state data for each cell
for i = 1:numel(inputs)
    [inputNormalized{i}, inputNormParams{i}] = normalize(inputs{i}, 'center', 'mean', 'scale', 'std');
    [stateNormalized{i}, stateNormParams{i}] = normalize(states{i}, 'center', 'mean', 'scale', 'std');
end



Ts = 0.01; % Sample time [s]
p = 10; % Prediction horizon [s]

% Define a neural state space model
obj = idNeuralStateSpace(1, NumInput = 4, Ts = Ts); % 1 state, 4 inputs.
% obj = idNeuralStateSpace(5, NumInput = 1, Ts = Ts); % 5 states, 1 input.

% Configure state and output networks
obj.StateNetwork = createMLPNetwork(obj,'state',LayerSizes=[128 128],Activations="tanh",WeightsInitializer="glorot",BiasInitializer="zeros");
% obj.OutputNetwork = createMLPNetwork(obj,'output',LayerSizes=[128 128],Activations="tanh",WeightsInitializer="glorot",BiasInitializer="zeros");


% Specify training options for state network
N = 600;
StateOpt = nssTrainingOptions('adam');
StateOpt.MaxEpochs = 100;
StateOpt.MiniBatchSize = 10;
StateOpt.InputInterSample = 'spline';
StateOpt.LearnRate = 0.001;


% Specify training options for output network
OutputOpt = nssTrainingOptions('sgdm');
OutputOpt.MaxEpochs = 100;
OutputOpt.MiniBatchSize = N/10;
OutputOpt.InputInterSample = 'spline';


% Train the model with normalized data
obj = nlssest(inputNormalized, stateNormalized, obj, StateOpt, 'UseLastExperimentForValidation', true);

% Predict using the normalized input data
predictedStatesNormalized = cell(size(inputNormalized));
predictedStates = cell(size(inputNormalized));


for i = 1:numel(inputNormalized)
    predictedStatesNormalized{i} = predict(obj, inputNormalized{i});
    % Revert the normalization for predictions
    predictedStates{i} = rescale(predictedStatesNormalized{i}, stateNormParams{i});
end