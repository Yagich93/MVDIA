% Cleaning.
clc;
clearvars;
close all;

% Load image.
img = imread('MVDIA_Exercise06_images/ex6t1.tif');

% Median filter.
imgm = medfilt2(img, 'symmetric');
imgm2 = medfilt2(imgm, 'symmetric');
imgm3 = medfilt2(imgm2, 'symmetric');

% Plotting.
figure('name', 'Median filtering');
plotI = {img, imgm, imgm2, imgm3};
plotTitles = {'Original', 'Median 3x3 (x1)', 'Median 3x3 (x2)', 'Median 3x3 (x3)'};
subx = size(plotI, 2);
suby = 1;
for subc = 1:size(plotI, 2);
    subplot(suby, subx, subc);
    imshow(plotI{subc});
    title(plotTitles{subc});
end