% Cleaning.
clc;
clearvars;
close all;

% Image size.
N = 512;

% Create profiles.
prof(1,:,1) = fliplr(0:1/(N-1):1);
prof(1,1:N/2,2) = 0:2/(N-1):1;
prof(1,N/2+1:N,2) = fliplr(0:2/(N-1):1);
prof(1,:,3) = 0:1/(N-1):1;

% Generate image.
img = repmat(prof, N, 1, 1);

% Plotting.
% Plot profiles.
figure('name', 'Image with profiles');
subplot(2,1,1);
hold on;
plot(prof(1,:,1));
plot(prof(1,:,2));
plot(prof(1,:,3));
hold off;
title('Profiles');
% Plot image.
subplot(2,1,2);
imshow(img);
title('Image');