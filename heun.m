function [t,y] = heun(dydt,tspan,y0,h)
% [t,y] = heun(dydt,tspan,y0,h):
% Written by: Khanh Nguyen
% Student ID: 32498349 
% Last modified: Sunday 10th October 2021
%
% Description
% -------------------
% This function uses the Heun's Method to solve an ODE.
%
% Input Arguments
% -------------------
% dydt = function handle of the ODE, f(t,y)
% tspan = [<initial value>, <final value>] of independent variable
% y0 = initial value of dependent variable
% h = step size
% 
% Output Arguments
% -------------------
% t = vector of independent variable
% y = vector of solution for dependent variable

% Input Validation: tspan
if ~(tspan(2)>tspan(1))
    error('upper limit must be greater than lower')
end

% Create all independant values, t:
t = (tspan(1):h:tspan(2))';
n = length(t);

% If necessary, add an additional t so that range goes up to tspan(2):
if t(n)<tspan(2)
    t(n+1) = tspan(2);
    n = n+1;
end

% Implement Heun's Method:
y = y0*ones(n,1); % Preallocate y to improve efficiency
for i = 1:n-1
    ypred = y(i) + dydt(t(i),y(i))*(t(i+1)-t(i));
    y(i+1) = y(i) + (dydt(t(i),y(i))+dydt(t(i+1),ypred))/2*(t(i+1)-t(i));
end

end