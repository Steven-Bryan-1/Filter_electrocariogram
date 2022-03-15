%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Computer Assignment 3
%%%% Steven Bryan & Nawfel Mahmood
%%%% 3/16/20
%%%%
%%%% The purpose of this code is to create a filter 
%%%% to filter out a noise signal at 60 Hz
%%%% and leave an ecg signal of a heartbeat 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%load the ecg data
load('ecg_data.txt');
fs=1000;

%create the elliptical filter
[num,den] = ellip(3,3,40,2*pi*27,'s');
    
%create the transfer function for the filter
H_ellipe= tf(num,den)
    
%assign t and u the values from the data file
t=ecg_data(:,1);
u=ecg_data(:,2);



hold on

%use lsim to simulate the system using the transfer funtion
%and the t and u values that were given.  This will plot results
lsim(H_ellipe, u, t);
x=lsim(H_ellipe, u, t);
%soundsc(x, fs)
%bode(H_ellipe);
%plot(t,u);

