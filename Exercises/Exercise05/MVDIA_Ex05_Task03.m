% Cleaning.
clc;
clearvars;
close all;

% Load image.
imgg = imread('MVDIA_Exercise05_images/Lena_gray.png');
imgb = imread('MVDIA_Exercise05_images/Lena_s.png');

% Sharpening.
simgb = imsharpen(imgb, 'Radius', 2, 'Amount',1.5);
%simgb = imsharpen(imgb, 'Radius', 3, 'Amount',0.4);

% Display error.
disp('Blurred mean error std:');
disp(sqrt(mean(mean((double(imgg)-double(imgb)).^2))));
disp('Sharpened mean error std:');
disp(sqrt(mean(mean((double(imgg)-double(simgb)).^2))));

% Plotting.
figure('name', 'Histograms');
subx = 3;
suby = 2;
subc = 0;
% Original img.
subc = subc + 1;
subplot(suby, subx, subc);
imshow(imgg);
% Blurred img.
subc = subc + 1;
subplot(suby, subx, subc);
imshow(imgb);
% Sharpened img.
subc = subc + 1;
subplot(suby, subx, subc);
imshow(simgb);
% Original img.
subc = subc + 1;
subplot(suby, subx, subc);
imshow(imgg);
% Difference with blurred img.
subc = subc + 1;
subplot(suby, subx, subc);
imshow(abs(double(imgg)-double(imgb))./255.*2);
% Difference with sharpened img.
subc = subc + 1;
subplot(suby, subx, subc);
imshow(abs(double(imgg)-double(simgb))./255.*2);