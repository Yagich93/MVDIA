% Cleaning.
clc;
clearvars;
close all;

% Load images.
imgh = imread('MVDIA_Exercise07_images/ex7t2H.tif');
imgs = imread('MVDIA_Exercise07_images/ex7t2S.tif');
imgl = imread('MVDIA_Exercise07_images/ex7t2I.tif');

% Plotting.
figure('name', 'HSI colors');
plotI = {imgh, imgs, imgl};
plotTitles = {'Hue', 'Saturation', 'Lightness (Intensity)'};
subx = 3;
suby = ceil(size(plotI, 2)/3);
for subc = 1:size(plotI, 2)
    subplot(suby, subx, subc);
    imshow(plotI{subc});
    title(plotTitles{subc});
end