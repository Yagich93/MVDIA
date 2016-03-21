% Cleaning.
clc;
clearvars;
close all;

% Distribution params.
mo = 150;
so = 20;
mb = 25;
sb = 25;

% A priori probabilities.
Po = 0.2;
Pb = 0.8;

% Solution.
A = so^2 - sb^2
B = 2*(mo*sb^2 - mb*so^2)
C = so^2*mb^2 - sb^2*mo^2 + 2*so^2*sb^2*log(sb*Po/so/Pb)

% Results.
T1 = (-B + sqrt(B^2 - 4*A*C))/2/A
T2 = (-B - sqrt(B^2 - 4*A*C))/2/A

% Distributions.
p = @(z, m, s) 1./s./sqrt(2.*pi).*exp(-(z-m).^2./2./s.^2);
po = @(z) Po.*p(z, mo, so);
pb = @(z) Pb.*p(z, mb, sb);

x  = 0:255;
yo = po(x);
yb = pb(x);

% Plotting.
hold on;
plot(x, yo);
plot(x, yb);
plot(T1*ones(100), linspace(0, 0.015, 100));
hold off;