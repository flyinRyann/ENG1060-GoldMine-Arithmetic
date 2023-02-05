% Q1

% Some code may already be provided below
% DO NOT clear, close or clc inside this script
% Apply good programming practices
%
% Name : Khanh Gia Nguyen
% ID   : 32498349
% Date Modified : Tuesday 14th September 2021

fprintf('\n Q1 \n\n')
%%
% (i)
filetemp = importdata("10friends_gold.txt");
people = {'Tom', 'Jeff', 'Bianca', 'Olivia', 'Mark', 'Dave', 'Chee', 'Kate', 'Hiro', 'Sanjay'};
file = importdata("10friends_gold.txt").data;

% (ii)
[gold_max, index] = max(file(:,2));
gold_max_person = people{index};
fprintf('The person with the max amount of gold is %s with %1.3f grams of gold.\n', gold_max_person, gold_max);

% (iii) 
% Recovery rate is grams per minute so it is Gold Weight divided by Time.
recovery_rate = file(:,2)./file(:,3);
[max_recovery_rate, index2] = max(recovery_rate);

% Note that index2 is the person with the highest recovery rate.
max_recovery_person = people{index2};
fprintf('The person with the highest recovery rate is %s with an recovery rate of %1.5f grams per minute.\n', max_recovery_person, max_recovery_rate);

% (iv)
% $80 times recovery rate gets $ per minute. Then, divided by 60 to get per hour.
productivity = (max_recovery_rate*60)*80;
fprintf('%s would make $%1.1f per hour with their recovery rate, at $80 per gram of gold.\n', max_recovery_person, productivity);

