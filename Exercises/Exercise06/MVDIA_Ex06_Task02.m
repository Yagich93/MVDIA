% Periodic noise reduction.

% Cleaning.
clc;
clearvars;
close all;

% Load image.
img = imread('MVDIA_Exercise06_images/Lena_fn.png');

% Plotting.
figure('name', 'Periodic noise reduction');
plotI = {img};
plotTitles = {'Original'};
subx = ceil(size(plotI, 2)/1);
suby = ceil(size(plotI, 2)/1);
for subc = 1:size(plotI, 2);
    subplot(suby, subx, subc);
    imshow(plotI{subc});
    title(plotTitles{subc});
end