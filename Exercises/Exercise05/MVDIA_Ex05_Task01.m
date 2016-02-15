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

% Fit Rayleigh distribution.
ft = fittype('c*(x>=a)*2/b*(x-a)*exp(-(x-a)^2/b)',...
    'coefficients',{'a','b','c'});
myfit = fit(binLocations, counts, ft, 'Lower',[0,0,0],...
    'Upper',[255,100000,100000],'StartPoint',[128,5,1]);
plot(myfit, binLocations, counts);