% Motion blur reduction.

% Cleaning.
clc;
clearvars;
close all;

% Load image.
img = imread('MVDIA_Exercise06_images/ex6t3.png');

% Motion blur filter.
h = fspecial('motion', 200, 135);

% Remove motion blur assuming no noise.
imgwnn = deconvwnr(img, h, 0);

% Remove motion blur with noise estimation.
roic = [1090 1336 86 306];
roi = img(roic(3):roic(4), roic(1):roic(2));
nsre = var(double(roi(:))) / var(double(img(:)));
imgwne = deconvwnr(img, h, nsre);

% Plotting.
figure('name', 'Motion blur reduction');
plotI = {img, h/max(max(h)), imgwnn, imgwne};
plotTitles = {'Original', 'Motion blur filter',...
    'Wiener deconvolution, no noise',...
    'Wiener deconvolution, noise estimation'};
subx = size(plotI, 2);
suby = 1;
for subc = 1:size(plotI, 2)
    subplot(suby, subx, subc);
    imshow(plotI{subc});
    title(plotTitles{subc});
end