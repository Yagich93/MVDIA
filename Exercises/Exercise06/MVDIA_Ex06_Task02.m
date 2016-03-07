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

% Remove secondary lines.
Fnl = F;
Fnl(225, :) = 0;
Fnl(289, :) = 0;
Fnl(:, 129) = 0;
Fnl(:, 385) = 0;
imgnl = uint8(ifft2(ifftshift(Fnl)));

% Function for spectrum processing for plotting.
sp = @(F)log(abs(F))./max(max(log(abs(F))));

% Plotting.
figure('name', 'Periodic noise reduction');
plotI = {img, imgnp, imgnl, sp(F), sp(Fnp), sp(Fnl)};
plotTitles = {'Original', 'No peaks', 'No lines',...
           'Original spectrum', 'No peaks spectrum', 'No lines spectrum'};
subx = ceil(size(plotI, 2)/2);
suby = 2;
for subc = 1:size(plotI, 2);
    subplot(suby, subx, subc);
    imshow(plotI{subc});
    title(plotTitles{subc});
end