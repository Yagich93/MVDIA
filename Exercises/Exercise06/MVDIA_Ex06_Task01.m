% Cleaning.
clc;
clearvars;
close all;

% Load image.
img = imread('MVDIA_Exercise06_images/ex6t1.tif');

% Median filter.
imgm = medfilt2(img, 'symmetric');

% Plotting.
figure('name', 'Median filtering');
plotI = {img, imgm};
plotTitles = {'Original', 'Median 3x3 (x1)'};
subx = size(plotI, 2);
suby = 1;
for subc = 1:size(plotI, 2);
    subplot(suby, subx, subc);
    imshow(plotI{subc});
    title(plotTitles{subc});
end