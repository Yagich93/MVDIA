% Cleaning.
clc;
clearvars;
close all;

% Load images.
imga(:,:,1) = imread('MVDIA_Exercise07_images/ex7t3AR.tif');
imga(:,:,2) = imread('MVDIA_Exercise07_images/ex7t3AG.tif');
imga(:,:,3) = imread('MVDIA_Exercise07_images/ex7t3AB.tif');
imgb(:,:,1) = imread('MVDIA_Exercise07_images/ex7t3BR.tif');
imgb(:,:,2) = imread('MVDIA_Exercise07_images/ex7t3BG.tif');
imgb(:,:,3) = imread('MVDIA_Exercise07_images/ex7t3BB.tif');

% Plotting.
figure('name', 'Color gradients');
plotI = {imga(:,:,1), imga(:,:,2), imga(:,:,3), imga,...
    imgb(:,:,1), imgb(:,:,2), imgb(:,:,3), imgb};
plotTitles = {'ImageA_R', 'ImageA_G', 'ImageA_B', 'ImageA',...
    'ImageB_R', 'ImageB_G', 'ImageB_B', 'ImageB'};
subx = 4;
suby = ceil(size(plotI, 2)/subx);
for subc = 1:size(plotI, 2)
    subplot(suby, subx, subc);
    imshow(plotI{subc});
    title(plotTitles{subc});
end