% Cleaning.
clc;
clearvars;
close all;

% Calculations for each image.
K = 4;
f = cell(K, 1);
F = cell(K, 1);
colormap gray;
for k = 1:K
    % Open image.
    f{k} = imread(sprintf('ex3%i.tif', k));
    f{k} = f{k}(:,:,1);
    
    % Fourier transform.
    F{k} = fftshift(fft2(f{k}));

    % Plotting.
    rw = 6;
    subplot(K, rw, rw*(k-1) + 1);
    image(f{k}, 'CDataMapping', 'scaled');
    subplot(K, rw, rw*(k-1) + 2);
    image(real(F{k}), 'CDataMapping', 'scaled');
    subplot(K, rw, rw*(k-1) + 3);
    image(imag(F{k}), 'CDataMapping', 'scaled');
    subplot(K, rw, rw*(k-1) + 4);
    image(abs(F{k}), 'CDataMapping', 'scaled');
    subplot(K, rw, rw*(k-1) + 5);
    image(angle(F{k}), 'CDataMapping', 'scaled');
    subplot(K, rw, rw*(k-1) + 6);
    image(log(abs(F{k})+1), 'CDataMapping', 'scaled');
end