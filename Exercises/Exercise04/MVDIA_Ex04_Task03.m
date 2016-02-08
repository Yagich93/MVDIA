% Cleaning.
clc;
clearvars;
close all;

% Load image.
img = imread('MVDIA_Exercise04_images\ex4t3.jpg');
img = rgb2gray(img);

% Histogram.
[counts,binLocations] = imhist(img);

% Plotting.
figure('name', 'Histograms');
subx = 2;
suby = 1;
subc = 0;
% Original img.
subc = subc + 1;
subplot(suby, subx, subc);
imshow(img);
% Original hist.
subc = subc + 1;
subplot(suby, subx, subc);
imhist(img);