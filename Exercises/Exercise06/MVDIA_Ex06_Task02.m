% Periodic noise reduction.
%
% NOTE: The script might not run because of the forward/backward-slash
% issue in paths to images. Choose the correct slashes, according to your
% system.
% 
% The input image for the experiment has an intensive periodic noise.
% The general shape of the image can be recognized, but the details cannot
% be seen clearly. This periodic noise results in regular peaks in the
% spectrum of the image. Those peaks also have additional vertical and
% horizontal lines, emerging from them.
%
% Removal of the secondary spectral peaks only (the points with maximal
% amplitude), but retaining the lines gives the following result. The
% periodic noise lessens in the center of and image, but remains intensive
% on the sides. The effect is seen more in the horizontal direction. The
% shape of the noise stays the same.
%
% Removal of the whole vertical and horizontal lines in spectrum, having
% the same coordinates as peaks, reduces the noise much more. There can be
% seen almost no noise in the center of the image, but a light noise with
% the same shape can still be seen on the sides.
%
% Removal of the 3-pixel-wide bands instead of the lines in spectrum lowers
% the noise level even further: the remainings of the original noise can
% only be seen in the corners of the image. At the same time, some
% distortions are introduced due to the loss of information: not all the
% values omitted from the spectrum contain noise - some of them hold actual
% information.
%
% In order to get rid of the original noise completely and still retain the
% informative part of the image (i.e. not introduce distortions), some more
% complex shapes of the spectral filters should be proposed, removing only
% corrupted spectral values.

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

% Remove secondary bands.
Fnb = F;
Fnb(224:226, :) = 0;
Fnb(288:290, :) = 0;
Fnb(:, 128:130) = 0;
Fnb(:, 384:386) = 0;
imgnb = uint8(ifft2(ifftshift(Fnb)));

% Function for spectrum processing for plotting.
sp = @(F)log(abs(F))./max(max(log(abs(F))));

% Plotting.
figure('name', 'Periodic noise reduction');
plotI = {img, imgnp, imgnl, imgnb, sp(F), sp(Fnp), sp(Fnl), sp(Fnb)};
plotTitles = {'Original', 'No peaks', 'No lines', 'No bands',...
              'Original spectrum', 'No peaks spectrum',...
              'No lines spectrum', 'No bands spectrum'};
subx = ceil(size(plotI, 2)/2);
suby = 2;
for subc = 1:size(plotI, 2)
    subplot(suby, subx, subc);
    imshow(plotI{subc});
    title(plotTitles{subc});
end