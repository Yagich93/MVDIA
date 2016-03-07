% Median and adaptive median filtering.
%
% NOTE: The script might not run because of the forward/backward-slash
% issue in paths to images. Choose the correct slashes, according to your
% system.
% 
% The input image for the experiment has an intensive salt&pepper noise.
% Any details are hardly recognizible in it.
%
% The use of small-window (3x3) median filtering tends to retain
% considerable amount of noise (mostly, big spots of salt or pepper).
% Successive usage of the same filtering lessens the amount of small
% impulses, but the big ones stay.
%
% Larger windows of median filters reduce much more noise, but tend to
% corrupt image details much. The resulting image seems to be blurred and
% the borders - distorted.
%
% Adaptive median filters reduce approximately the same amount of noise, as
% median filters with the window size of the maximal adaptive window size.
% On the other hand, adaptive median filters retain the image details, that
% cannot be seen both on original and on median-filtered (and thus blurred)
% images. The borders are corrupted much less as well.
%
% The function for adaptive median filtering is taken from Gonzalez, Woods
% et al.

% Cleaning.
clc;
clearvars;
close all;

% Load image.
img = imread('MVDIA_Exercise06_images/ex6t1.tif');

% Median filter.
imgm3x3_1 = medfilt2(img, [3 3], 'symmetric');
imgm3x3_2 = medfilt2(imgm3x3_1, [3 3], 'symmetric');
imgm5x5 = medfilt2(img, [5 5], 'symmetric');
imgm7x7 = medfilt2(img, [7 7], 'symmetric');

% Adaptive median filter.
imgam5x5 = adpmedian(img, 5);
imgam7x7 = adpmedian(img, 7);

% Plotting.
figure('name', 'Median filtering');
plotI = {img, imgm3x3_1, imgm3x3_2,...
         img, imgm5x5, imgm7x7,...
         img, imgam5x5, imgam7x7};
plotTitles = {'Original', 'Median 3x3 (x1)', 'Median 3x3 (x2)',...
              'Original', 'Median 5x5', 'Median 7x7',...
              'Original', 'Adaptive median 5x5', 'Adaptive median 7x7'};
subx = 3;
suby = ceil(size(plotI, 2)/3);
for subc = 1:size(plotI, 2)
    subplot(suby, subx, subc);
    imshow(plotI{subc});
    title(plotTitles{subc});
end