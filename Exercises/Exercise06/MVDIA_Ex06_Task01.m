% Cleaning.
clc;
clearvars;
close all;

% Load image.
img = imread('MVDIA_Exercise06_images/ex6t1.tif');

% Plotting.
figure('name', 'Median filtering');
plotI = {img};
plotTitles = {'Original'};
subx = 1;
suby = 1;
for subc = 1:size(plotI, 2);
    subplot(suby, subx, subc);
    imshow(plotI{subc});
    title(plotTitles{subc});
end