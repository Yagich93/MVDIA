% Cleaning.
clc;
clearvars;
close all;

% Load images.
img_hsl(:,:,1) = imread('MVDIA_Exercise07_images/ex7t2H.tif');
img_hsl(:,:,2) = imread('MVDIA_Exercise07_images/ex7t2S.tif');
img_hsl(:,:,3) = imread('MVDIA_Exercise07_images/ex7t2I.tif');

% Generate image.
img = hsl2rgb(double(img_hsl)./255);

% Plotting.
figure('name', 'HSI colors');
plotI = {img_hsl(:,:,1), img_hsl(:,:,2), img_hsl(:,:,3), img};
plotTitles = {'Hue', 'Saturation', 'Lightness (Intensity)', 'Image'};
subx = 3;
suby = ceil(size(plotI, 2)/3);
for subc = 1:size(plotI, 2)
    subplot(suby, subx, subc);
    imshow(plotI{subc});
    title(plotTitles{subc});
end