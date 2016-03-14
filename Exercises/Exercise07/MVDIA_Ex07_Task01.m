% Cleaning.
clc;
clearvars;
close all;

% Image size.
N = 512;

% Create profiles.
prof(1,:,1) = fliplr(0:1/(N-1):1);
prof(1,1:N/2,2) = 0:2/(N-1):1;
prof(1,N/2+1:N,2) = fliplr(0:2/(N-1):1);
prof(1,:,3) = 0:1/(N-1):1;

% Generate image.
img = repmat(prof, N, 1, 1);

% Get HSV channels.
img_hsl = rgb2hsl(img);

% Display values at N/2.
disp('RGB');
disp([img(1,N/2,1), img(1,N/2,2), img(1,N/2,3)]);
disp('HSL');
disp([img_hsl(1,N/2,1), img_hsl(1,N/2,2), img_hsl(1,N/2,3)]);

% Plotting.
subx = 3;
suby = 2;
subc = 0;
% Plot profiles.
figure('name', 'Image with profiles');
subc = subc + 1;
subplot(suby,subx,subc);
hold on;
plot(prof(1,:,1));
plot(prof(1,:,2));
plot(prof(1,:,3));
hold off;
title('Profiles');
% Plot image.
subc = subc + 1;
subplot(suby,subx,subc);
imshow(img);
title('Image');
% Plot hue.
subc = subc + 1;
subc = subc + 1;
subplot(suby,subx,subc);
imshow(img_hsl(:,:,1));
title('Hue');
% Plot saturation.
subc = subc + 1;
subplot(suby,subx,subc);
imshow(img_hsl(:,:,2));
title('Saturation');
% Plot value (Intensity).
subc = subc + 1;
subplot(suby,subx,subc);
imshow(img_hsl(:,:,3));
title('Lightness (Intensity)');