% Cleaning.
clc;
clearvars;
close all;

% Load image.
img = imread('MVDIA_Exercise05_images/Lena_n.png');

% Flat region of interest.
rc = [110 10 290 20];
imgroi = img(rc(2):rc(4),rc(1):rc(3));

% Noise histogram.
[counts,binLocations] = imhist(imgroi);
imhist(imgroi);