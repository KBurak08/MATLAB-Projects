% ELM361 MATLAB BONUS PROJECT
% BURAK KAMİL ÇİFTCİ
% 1801022077

close all;
clear;
clc;

% Specifications
Fo = 1000;                          
t = (0:1/Fo:2-1/Fo)';                 
matrix_length = length(t);          
f = -Fo:1:Fo-1;                     

t = -3:0.0001:3;
fs = 1/0.0001;
Fn = fs/2;
freq = linspace(-Fn, Fn, numel(t));

func = @ (t) rectangularPulse(-1/2,1/2,t);
mt = func(t-0.5)-func(t-1.5);

% --------- m(t)  ---------- %

figure(1);
plot(t,mt);
title("Message Signal m(t)");
xlabel("Time (s)");
ylabel("m(t)");

% --------- M(f)  ---------- %

M = fftshift(fft(mt))/fs; 
figure(2)
plot(freq, abs(M)); 
xlim([-10 10]);
title("Message Signal Spectrum M(f)");
xlabel("Frequency (Hz)");
ylabel("M(f)");

% --------- fi(t)  ---------- %

integral_mt = triangularPulse(t-1);
Kf = 50;
fi_t = 2*pi*Kf*integral_mt;
figure(3);
plot(t,fi_t);
title("fi(t) Signal");
xlabel("Time (s)");
ylabel("fi(t)");

% --------- Fi(f)  ---------- %

Fi_f = fftshift(fft(fi_t))/fs ;
figure(4);
plot(freq,abs(Fi_f));
xlim([-10 10]);
title("Fi(f) Signal Spectrum");
xlabel("Frequency (Hz)");
ylabel("Fi(f)");

% --------- y(t)  ---------- %

yt = 5*cos(2*pi*200*t + fi_t);
figure(5)
plot(t,yt)
title("y(t) Signal");
xlabel("Time (s)");
ylabel("y(t)");

% --------- Y(f) ---------- %

Yf = fftshift(fft(yt))/fs ;
figure(6)
plot(freq,abs(Yf))
title("Y(f) Signal Spectrum");
xlabel("Frequency (Hz)");
ylabel("Y(f)");

% --------- Demodulator  ---------- %

dt_of_yt = fs.*diff(yt);                       
dt_of_yt = [dt_of_yt(1),dt_of_yt];
dt_of_yf = fftshift(fft(dt_of_yt))/fs ;         
env = abs(hilbert(dt_of_yt));                   
dt_of_yt =  max(dt_of_yt, 0);                  
env_f= fftshift(fft(env))/fs ;                  
dcblock = env - 2*pi*1000;                      
dcblock_f= fftshift(fft(dcblock))/fs ;          

%after differential operation
figure(7) 
plot(t,dt_of_yt)
title('After differential operation signal with time domain')
xlabel("Time (s)");
ylabel("d/dt");
grid
figure(8)
plot(freq,abs(dt_of_yf))
title('After differential operation signal with frequency domain')
xlabel("Frequency (Hz)");
ylabel("d/dt");
grid

%after envelope detector operation
figure(9)
plot(t,env)
title('After Envelope detector operation signal with time domain')
xlabel("Time (s)");
ylabel("Envelope detector operation");
grid
figure(10)
plot(freq,abs(env_f))
title('After Envelope detector operation signal with frequency domain')
xlabel("Frequency (Hz)");
ylabel("Envelope detector operation");
grid

%after dc blocking operation
figure(11)
plot(t,dcblock)
title('After Dc blocking operation signal with time domain')
xlabel("Time (s)");
ylabel("Dc blocking operation");
grid
figure(12)
plot(freq,abs(dcblock_f))
title('After Dc blocking operation signal with frequency domain')
ylabel("Dc blocking operation");
grid
