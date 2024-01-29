function [C, D] = outputFcnJacobian(x,u)
%% auto-generated output Jacobian function of neural state space system
%# codegen
C = eye(4);
D = zeros(4,1);
