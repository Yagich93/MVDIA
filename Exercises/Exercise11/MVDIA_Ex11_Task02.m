% Cleaning
clc;
clearvars;
close all;

% Loading images
i1 = imread('MVDIA_Exercise11_images/ex11t2a.tif');
i2 = imread('MVDIA_Exercise11_images/ex11t2b.tif');
i3 = imread('MVDIA_Exercise11_images/ex11t2c.tif');

% Plotting
figure('name', 'MVDIA_Ex11_Task02');
is = {i1, i2, i3};
ts = {'Noise', 'Cosine', 'Structures'};
subx = length(is);
suby = 1;
for subc = 1:length(is)
    subplot(suby, subx, subc);
    imshow(is{subc});
    title(ts{subc});
end