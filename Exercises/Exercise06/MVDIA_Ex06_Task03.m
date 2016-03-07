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

% Plotting.
figure('name', 'Motion blur reduction');
plotI = {img, h/max(max(h)), imgwnn};
plotTitles = {'Original', 'Motion blur filter',...
    'Wiener deconvolution, no noise'};
subx = size(plotI, 2);
suby = 1;
for subc = 1:size(plotI, 2)
    subplot(suby, subx, subc);
    imshow(plotI{subc});
    title(plotTitles{subc});
end