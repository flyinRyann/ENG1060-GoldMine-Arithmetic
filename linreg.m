function [a0,a1,r2] = linreg(x,y)
% [a0,a1,r2] = linreg(x,y)
% Name: Khanh Nguyen
% Student ID: 32498349
% Last Modified: Fri 24th Sep 2021
% 
% Description
% -------------------
% This function produce the coefficient of a linearised function for a set
% of data, being modelled. 
%
% Input Arguments
% -------------------
% x = x-value data points. 
% y = y-value data points.
%
% Output Arguments
% -------------------
% a0 = a coefficient of the linearised model.
% a1 = a coefficient of the linearised model.
% r2 = the coefficient of determination.
%

% Variables:
n = length(x);
sx = sum(x);
sy = sum(y);
sx2 = sum(x.^2);
sxy = sum(x.*y);

% Regression Coefficients:
a1 = (n*sxy-sx*sy)/(n*sx2-sx^2);
a0 = mean(y)-a1*mean(x);

% r2 Value:
st = sum((y-mean(y)).^2);
sr = sum((y-a0-a1*x).^2);
r2 = (st-sr)/st;
end