% Cleaning.
clc;
clearvars;
close all;

% Load image.
img = imread('MVDIA_Exercise04_images\Lena.png');
img = rgb2gray(img);

% Gabor filtering.
wv = 5;
or = 90;
[mag,phase] = imgaborfilt(img,wv,or);

% Plotting images.
figure('name', 'Gabor filtering');
subx = 3;
suby = 1;
plotI = {img, mag, phase};
plotTitles = {'Original', 'Gabor magnitude', 'Gabor phase'};
colormap gray;
for subc = 1:size(plotI, 2);
    subplot(suby, subx, subc);
    image(plotI{subc}, 'CDataMapping', 'scaled');
    title(plotTitles{subc});
    axis equal;
    axis([0, 512, 0, 512]);
end