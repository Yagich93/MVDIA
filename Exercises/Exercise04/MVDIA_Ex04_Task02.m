% Cleaning.
clc;
clearvars;
close all;

% Load image.
img = imread('MVDIA_Exercise04_images\Lena.png');
img = rgb2gray(img);

% Gabor filtering.
wv = 4:2:16;
or = 0:15:180;
g = gabor(wv, or);
[mag,phase] = imgaborfilt(img,g);

% Eye rectangle.
er = [240, 250, 360, 280];

% Plotting images.
figure('name', 'Gabor filtering');
subx = length(wv);
suby = length(or);
colormap gray;
for subc = 1:size(mag, 3);
    subplot(suby, subx, subc);
    
    % Show magnitudes in eye rectangle.
    %image(mag(er(2):er(4),er(1):er(3),subc), 'CDataMapping', 'scaled');
    
    % Show eyes in eye rectangle.
    %image(img(er(2):er(4),er(1):er(3)), 'CDataMapping', 'scaled');
    
    % Show pair of magnitudes and eyes in eye rectangle.
    imshowpair(mag(er(2):er(4),er(1):er(3),subc),...
        img(er(2):er(4),er(1):er(3)), 'falsecolor');
    
    axis([1, er(3)-er(1), 1, er(4)-er(2)]);
end