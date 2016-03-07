% Periodic noise reduction.

% Cleaning.
clc;
clearvars;
close all;

% Load image.
img = imread('MVDIA_Exercise06_images/Lena_fn.png');

% Fourier transform.
F = fftshift(fft2(img));

% Remove secondary peaks.
Fnp = F;
Fnp(225, 129) = 0;
Fnp(289, 129) = 0;
Fnp(225, 385) = 0;
Fnp(289, 385) = 0;
imgnp = uint8(ifft2(ifftshift(Fnp)));

% Plotting.
figure('name', 'Periodic noise reduction');
plotI = {img, log(abs(F))./max(max(log(abs(F)))),...
         imgnp, log(abs(Fnp))./max(max(log(abs(Fnp))))};
plotTitles = {'Original', 'Original spectrum', 'No peaks', 'No peaks spectrum'};
subx = ceil(size(plotI, 2)/1);
suby = 1;
for subc = 1:size(plotI, 2);
    subplot(suby, subx, subc);
    imshow(plotI{subc});
    title(plotTitles{subc});
end