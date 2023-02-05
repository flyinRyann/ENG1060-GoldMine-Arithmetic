% Q3

% Some code may already be provided below
% DO NOT clear, close or clc inside this script
% Apply good programming practices
%
% Name : Khanh Nguyen
% ID   : 32498349
% Date Modified : Wednesday 29th September 2021

fprintf('\n Q3 \n\n')
%%
% (i)
dcdx = @(x,c) (0.5*exp(-0.05*c))-((0.02*(x^2)*(c^2)));
xspan = [-10,20];
h = 0.001; 
c0 = 0.5;
[x,c] = heun(dcdx,xspan,c0,h);

figure(2)
plot(x,c)
xlabel('x (metres)')
ylabel('c (grams per cubic metres)')
title('The Gold Concentration against the Distance from the Water Line at Mid-tide')
hold on 

% (ii)
[max_c, index] = max(c);
line_maxc_dist = x(index);
fprintf('The maximum concentration that can be achieved is %1.2f, at a distance %1.2f away form the water line at the mid-tide.\n',max_c,line_maxc_dist)

% (iii)
plot(line_maxc_dist,max_c,'kd')
legend('Function c(x) Plot','Maximum Gold Concentration Point')
