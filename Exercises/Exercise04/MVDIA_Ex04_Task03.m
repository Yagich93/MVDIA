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

% New histogram construction.
n = 256;
hgram = ones(1,n);
for i = n/2:n
    hgram(i) = hgram(i) - (i-n/2)*2/n;
end
hgram = hgram/sum(hgram)*numel(img);

% New image.
imgn = histeq(img,hgram);

% Plotting.
figure('name', 'Histograms');
subx = 2;
suby = 4;
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
% Plot new histogram.
subc = subc + 1;
subplot(suby, subx, subc);
plot(1:n,hgram);
axis([0 n 0 max(hgram)]);
% New img.
subc = subc + 1;
subplot(suby, subx, subc);
imshow(imgn);
% New hist.
subc = subc + 1;
subplot(suby, subx, subc);
imhist(imgn);