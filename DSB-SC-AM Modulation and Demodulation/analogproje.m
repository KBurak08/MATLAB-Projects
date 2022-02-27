clc;
close all;
clear all;

% Burak Kamil ÇİFTCİ
% 1801022077

% part 1)

Ts = 0.0001;
Fs = 1/Ts;
t = 0:0.0001:1;
m = 20*cos(100*pi*t)+10*cos(200*pi*t);  

Fm = fftshift(Ts*fft(m));
figure;
subplot(2,1,1);
plot(t,m);
xlim([0 0.04]);
title("m(t)");
xlabel("Time t in seconds");
ylabel("The message signal m(t)");

subplot(2,1,2);
stem(t,abs(Fm));
title("M(F)");
xlabel("Frequency in Hertz");
ylabel("The message signal spectrum M(f)");

% part 2)
c = 100.*cos(500.*pi.*t);               
y = c.*m;
Fy = fftshift(Ts*fft(y));
figure;
subplot(2,1,1);
plot(t,y);
xlim([0 0.04]);
title("y(t)");
xlabel("Time t in seconds");
ylabel("The modulated signal y(t)");

subplot(2,1,2);
stem(t,abs(Fy));
title("Y(F)");
xlabel("Frequency in Hertz");
ylabel("The modulated signal spectrum Y(f)");

% part 3)
c2 = cos(100.*pi.*t);
e = c2.*y;
Fe = fftshift(Ts*fft(e));
figure;
subplot(2,1,1);
plot(t,e);
xlim([0 0.04]);
title("e(t)");
xlabel("Time t in seconds");
ylabel("The demodulated signal e(t)");

subplot(2,1,2);
stem(t,abs(Fe));
title("E(F)");
xlabel("Frequency in Hertz");
ylabel("The demodulated signal spectrum e(f)");

% part 4)
h = 500 * sinc (500*t);
H = fftshift(fft(h))/length(e);
Z = Fe .* H ;
z = ifftshift(ifft(Z));

figure;
subplot(2,1,1);
plot(t,z);
xlim([0 0.04]);
title("z(t)");
xlabel("Time t in seconds");
ylabel("The LPF output signal z(t)");

subplot(2,1,2);
stem(t,abs(Z));
title("Z(F)");
xlabel("Frequency in Hertz");
ylabel("The LPF output signal spectrum z(f)");

% part 5)
c2 = cos(520.*pi.*t);
e = c2.*y;
Fe = fftshift(Ts*fft(e));
figure;
subplot(2,1,1);
plot(t,e);
xlim([0 0.04]);
title("e(t) 520");
xlabel("Time t in seconds");
ylabel("The LPF output signal z(t)");

subplot(2,1,2);
stem(t,abs(Fe));
title("E(F) 520)");
xlabel("Frequency in Hertz");
ylabel("The LPF output signal spectrum z(f)");

h = 520 * sinc (520*t);
H = fftshift(fft(h))/length(e);
Z = Fe .* H ;
z = ifftshift(ifft(Z));

figure;
subplot(2,1,1);
plot(t,z);
xlim([0 0.04]);
title("z(t) 520");
xlabel("Time t in seconds");
ylabel("The LPF output signal z(t)");

subplot(2,1,2);
stem(t,abs(Z));
title("Z(F) 520");
xlabel("Frequency in Hertz");
ylabel("The LPF output signal spectrum z(f)");