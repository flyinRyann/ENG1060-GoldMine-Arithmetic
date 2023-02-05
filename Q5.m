% Q5

% Some code may already be provided below
% DO NOT clear, close or clc inside this script
% Apply good programming practices
%
% Name : Khanh Nguyen 
% ID   : 32498349
% Date Modified : Tuesday 12th October 2021

fprintf('\n Q5 \n\n')
%%
% (i) 
t = 0:1:180;
m = @(t) (0.01./(1+0.01.*t))+((cos(0.03.*pi.*t).^2)./(t+50));

figure(3)
plot(t,m(t))
xlabel('t (minutes)')
ylabel('m (grams per minute)')
title('The Mass of Gold capture by Sluice against Time')

% (ii)
total_mass = integral(m,0,180);
fprintf('The total mass of gold that this prospector got in 3 hours is %1.3f grams.\n\n',total_mass)

% (iii)
pros_earn = total_mass/3 * 80;
idol_ratio = per_hour_rate/pros_earn;
fprintf(['The prospecter earning rate is $%1.1f per hour. The ratio of our earnings relative to\n',...
'her earnings is %1.2f. From this, we can see that the spiral seperation did slightly worse\n',...
'as compared to river sluicing in the Golden Triangle.\n'],pros_earn,idol_ratio)