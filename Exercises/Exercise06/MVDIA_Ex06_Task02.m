% Periodic noise reduction.

% Cleaning.
clc;
clearvars;
close all;

% Load image.
img = imread('MVDIA_Exercise06_images/Lena_fn.png');

% Fourier transform.
F = fftshift(fft2(img));

% Plotting.
figure('name', 'Periodic noise reduction');
plotI = {img, log(abs(F))./max(max(log(abs(F))))};
plotTitles = {'Original', 'Original spectrum'};
subx = ceil(size(plotI, 2)/1);
suby = 1;
for subc = 1:size(plotI, 2);
    subplot(suby, subx, subc);
    imshow(plotI{subc});
    title(plotTitles{subc});
end