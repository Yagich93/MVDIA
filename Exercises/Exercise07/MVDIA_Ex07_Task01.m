% Cleaning.
clc;
clearvars;
close all;

% Image size.
N = 512;

% Create profiles.
prof(1,:) = fliplr(0:1/(N-1):1);
prof(2,1:N/2) = 0:2/(N-1):1;
prof(2,N/2+1:N) = fliplr(0:2/(N-1):1);
prof(3,:) = 0:1/(N-1):1;

% Plot profiles.
hold on;
plot(prof(1,:));
plot(prof(2,:));
plot(prof(3,:));
hold off;