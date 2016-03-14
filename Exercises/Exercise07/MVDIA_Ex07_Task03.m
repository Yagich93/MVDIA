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

% Get gradients.
[maga(:,:,1),dira(:,:,1)] = imgradient(imga(:,:,1));
[maga(:,:,2),dira(:,:,2)] = imgradient(imga(:,:,2));
[maga(:,:,3),dira(:,:,3)] = imgradient(imga(:,:,3));
[magb(:,:,1),dirb(:,:,1)] = imgradient(imgb(:,:,1));
[magb(:,:,2),dirb(:,:,2)] = imgradient(imgb(:,:,2));
[magb(:,:,3),dirb(:,:,3)] = imgradient(imgb(:,:,3));

% Plotting.
figure('name', 'Color gradients');
plotI = {imga(:,:,1), imga(:,:,2), imga(:,:,3), imga,...
    maga(:,:,1), maga(:,:,2), maga(:,:,3), [],...
    dira(:,:,1), dira(:,:,2), dira(:,:,3), [],...
    imgb(:,:,1), imgb(:,:,2), imgb(:,:,3), imgb,...
    magb(:,:,1), magb(:,:,2), magb(:,:,3), [],...
    dirb(:,:,1), dirb(:,:,2), dirb(:,:,3), []};
plotTitles = {'ImageA_R', 'ImageA_G', 'ImageA_B', 'ImageA',...
    'MagnitudeA_R', 'MagnitudeA_G', 'MagnitudeA_B', '',...
    'DirectionA_R', 'DirectionA_G', 'DirectionA_B', '',...
    'ImageB_R', 'ImageB_G', 'ImageB_B', 'ImageB',...
    'MagnitudeB_R', 'MagnitudeB_G', 'MagnitudeB_B', '',...
    'DirectionB_R', 'DirectionB_G', 'DirectionB_B', ''};
subx = 4;
suby = ceil(size(plotI, 2)/subx);
for subc = 1:size(plotI, 2)
    subplot(suby, subx, subc);
    imshow(plotI{subc});
    title(plotTitles{subc});
end