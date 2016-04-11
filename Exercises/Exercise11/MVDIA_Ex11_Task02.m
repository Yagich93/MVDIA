% Cleaning
clc;
clearvars;
close all;

% Loading images
i1 = imread('MVDIA_Exercise11_images/ex11t2a.tif');
i2 = imread('MVDIA_Exercise11_images/ex11t2b.tif');
i3 = imread('MVDIA_Exercise11_images/ex11t2c.tif');

% Gray-level co-occurence matrices
% Rule: one-pixel immediately to the right (default)
glcm1 = graycomatrix(i1);
glcm2 = graycomatrix(i2);
glcm3 = graycomatrix(i3);

% Statistical properties
% Maximum probability
mp = @(glcm) max(glcm(:)./sum(glcm(:)));
mp1 = mp(glcm1);
mp2 = mp(glcm2);
mp3 = mp(glcm3);
% Contrast, correlation, energy (uniformity), homogenity
st1 = graycoprops(glcm1);
st2 = graycoprops(glcm2);
st3 = graycoprops(glcm3);

% Plotting
figure('name', 'MVDIA_Ex11_Task02');
is = {i1, i2, i3, glcm1./max(glcm1(:)), glcm2./max(glcm2(:)),...
      glcm3./max(glcm3(:))};
ts = {'Noise', 'Cosine', 'Microscheme', 'GLCM1', 'GLCM2', 'GLCM3'};
subx = length(is)/2;
suby = 2;
for subc = 1:length(is)
    subplot(suby, subx, subc);
    imshow(is{subc});
    title(ts{subc});
end