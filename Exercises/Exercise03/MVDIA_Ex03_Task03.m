% Original signals.
f = {[1, 2, 3, 4];
     1i*[1, 2, 3, 4];
     [2, 1, 1, 1];
     [0, -1, 0, 1];
     1i*[2, 1, 1, 1];
     1i*[0, -1, 0, -1];
     [4+4i, 3+2i, 2i, 3+2i];
     [0, 1+1i, 0, -1-1j]};
K = length(f);

% Calculations for each signal.
for k = 1:K
    % Fourier transform.
    F{k} = fft(f{k});

    % Display results in the consol.
    disp('Function');
    disp(f{k});
    disp('Spectrum');
    disp(F{k});

    % Plotting.
    subplot(K, 4, 4*(k-1) + 1);
    plot(0:3, real(f{k}), 'x');
    subplot(K, 4, 4*(k-1) + 2);
    plot(0:3, imag(f{k}), 'x');
    subplot(K, 4, 4*(k-1) + 3);
    plot(0:3, real(F{k}), 'x');
    subplot(K, 4, 4*(k-1) + 4);
    plot(0:3, imag(F{k}), 'x');
end