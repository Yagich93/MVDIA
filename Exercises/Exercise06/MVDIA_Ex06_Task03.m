% Motion blur reduction.

% Cleaning.
clc;
clearvars;
close all;

% Load image.
img = imread('MVDIA_Exercise06_images/ex6t3.png');

% Motion blur filter.
h = fspecial('motion', 200, 135);

% Plotting.
figure('name', 'Motion blur reduction');
plotI = {img, h/max(max(h))};
plotTitles = {'Original', 'Motion blur filter'};
subx = size(plotI, 2);
suby = 1;
for subc = 1:size(plotI, 2)
    subplot(suby, subx, subc);
    imshow(plotI{subc});
    title(plotTitles{subc});
end