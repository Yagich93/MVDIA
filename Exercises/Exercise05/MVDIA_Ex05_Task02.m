% Cleaning.
clc;
clearvars;
close all;

% Load image.
imgg = imread('MVDIA_Exercise05_images/Lena_gray.png');
imgn = imread('MVDIA_Exercise05_images/Lena_n.png');

% Filtering.
fimgn = imgaussfilt(imgn, 1)+12;

% Display error.
disp('Noised mean error std:');
disp(sqrt(mean(mean((double(imgg)-double(imgn)).^2))));
disp('Filtered mean error std:');
disp(sqrt(mean(mean((double(imgg)-double(fimgn)).^2))));

% Plotting.
figure('name', 'Histograms');
subx = 3;
suby = 2;
subc = 0;
% Original img.
subc = subc + 1;
subplot(suby, subx, subc);
imshow(imgg);
% Noised img.
subc = subc + 1;
subplot(suby, subx, subc);
imshow(imgn);
% Filtered img.
subc = subc + 1;
subplot(suby, subx, subc);
imshow(fimgn);
% Original img.
subc = subc + 1;
subplot(suby, subx, subc);
imshow(imgg);
% Difference with noised img.
subc = subc + 1;
subplot(suby, subx, subc);
imshow(abs(double(imgg)-double(imgn))./255.*2);
axis equal;
axis([1, 512, 1, 512]);
% Difference with filtered img.
subc = subc + 1;
subplot(suby, subx, subc);
imshow(abs(double(imgg)-double(fimgn))./255.*2);
axis equal;
axis([1, 512, 1, 512]);