% Q2

% Some code may already be provided below
% DO NOT clear, close or clc inside this script
% Apply good programming practices
%
% Name : Khanh Nguyen
% ID   : 32498349
% Date Modified : Wednesday 29th September 2021

fprintf('\n Q2 \n\n')
%%
% (i)
file = importdata('SpiralPerformance.txt');
spin_time = file.data(:,1);
recovery = file.data(:,2);

% (ii)
% From the plot, the curve seems to follow a saturation-growth model.
x = 1./spin_time;
y = 1./recovery;
[a0, a1] = linreg(x,y);
a = 1/a0; % alpha value for saturation-growth model.
b = a*a1; % beta value for saturation-growth model.
s = 0:1:150; % s "spinning time" is a parameter for modelling the curve fit.
R = a.*(s./(s+b)); % R "recovery" is a parameter for modelling the curve fit.

% (iii)
% If the function had an infinite spinning time, then by taking the limit 
% for the saturation growth model where "s" approached infinity. Then, we
% have lim_(s->inf)(R) = a x (lim_(s->inf)(1))/(lim_(s->inf)((b/s)+1)).
% Ultimately, this results in the recovery approaching the a value, which
% is alpha. This is significant as it shows us there is a limit to the
% amount of recovery rate we can, therefore we can choose a amount of spin
% that gets us to a high recovery level, but no too high so that the amount
% of spin result in insignificant rewards (recovery time for gold).
fprintf('The recovery rate limit as the spin time approach infinity is %1.4f.\n', a);
fprintf('This is significant because it lets us know not to perform a long time of spin\nas the recovery rate increase will eventually become small and insignificant.\n')

% (iv)
% Values from the model that records recovery greater than or equal to 0.95
recovery_95 = R(R >= 0.95);
spin_time_95 = s(R >= 0.95);
fprintf('The amount of spin time required to achieve 95 percent recovery is %1.0f seconds.\n', spin_time_95(1));

% Plotting for All
figure(1)
plot(spin_time, recovery, 'bd')
xlabel('Spinning Time (seconds)')
ylabel('Recovery Rate')
title('Recovery Rate of Gold from Amount of Time Spinned')
hold on
plot(s,R)
legend('Raw Data Points', 'Saturation-Growth Model of the Data', 'location', 'southeast')