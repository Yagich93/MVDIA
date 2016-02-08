% Cleaning.
clc;
clearvars;
close all;

% Load image.
img = imread('MVDIA_Exercise04_images\ex4t3.jpg');
img = rgb2gray(img);

% Histogram.
[counts,binLocations] = imhist(img);

% Histogram equalization.
[imgeh, ~] = histeq(img);

% Image difference.
imgd = imabsdiff(img,imgeh);

% Plotting.
figure('name', 'Histograms');
subx = 2;
suby = 3;
subc = 0;
% Original img.
subc = subc + 1;
subplot(suby, subx, subc);
imshow(img);
% Original hist.
subc = subc + 1;
subplot(suby, subx, subc);
imhist(img);
% Img with equalized hist.
subc = subc + 1;
subplot(suby, subx, subc);
imshow(imgeh);
% Equalized hist.
subc = subc + 1;
subplot(suby, subx, subc);
imhist(imgeh);
% Img difference.
subc = subc + 1;
subplot(suby, subx, subc);
imshow(imgd);