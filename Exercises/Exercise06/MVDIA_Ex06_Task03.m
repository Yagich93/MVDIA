% Motion blur reduction.
%
% NOTE: The script might not run because of the forward/backward-slash
% issue in paths to images. Choose the correct slashes, according to your
% system.
% 
% The input image for the experiment seems to have experienced motion blur.
% This blur is manually estimated and then used to reconstruct original
% image in Wiener filtering.
%
% Reconstruction with the assumption of the degradation without noise gives
% highly noised result. Although, the contours of the object on the image
% seems to become correct, without motion blur.
%
% Estimation of the noise as the variance of the flat region and
% utilization of it to estimate noise to signal ratio makes the result
% clear, lacking intensive noise. However, some artifacts can still be
% seen: dim duplicates of the objects. This might be due to the
% imperfections of the chosen degradation function and noise estimations,
% as well as the impossibility of the ideal restoration by the given
% algorithm.

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