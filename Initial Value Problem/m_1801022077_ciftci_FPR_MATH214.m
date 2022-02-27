clear all
clc

vol = dlmread('fprdata.dat' , '' , [0,0,4,0]); % data read for diode voltage 
cur = dlmread('fprdata.dat' , '' , [0,1,4,1]); % data read for diode current

xi=0;
yi=0;
lnyi=0;
xi2=0;
lnyixi=0;

for i=1:5
    
    xi = xi + vol(i);                           % sum of xi
    yi = yi + cur(i);                           % sum of yi
    lnyi = log(cur(i)) + lnyi;                  % sum of ln(yi)
    xi2 = xi2 + vol(i)^2;                       % sum of xi^2
    lnyixi = log(cur(i)) * vol(i) + lnyixi;     % sum of xi*ln(yi)
    
end

a = ((5*lnyixi)-xi*lnyi)/((5*xi2)-(xi^2));      % calculated a value

lnb = ((xi2*lnyi)-(lnyixi*xi))/((5*xi2-xi^2));  % calculated lnb value

b = exp(lnb);                   % exponential lnb value
          
y = @(x)  b*exp(a*x);           % diode current function
                    
fvd = @(y) (log(y)-log(b))/a;   % diode voltage function

N=24;                           % 0.025 s iteration number
N2=240;                         % 0.0025 s iteration number
L=0.98;                         % inductor
R=14.2;                         % resistor
Vs=2;                           % voltage source 
h=0.025;                        % delta(t) for 0.025 s
h2=0.0025;                      %delta(t) for 0.0025 s
w1=zeros(25,1);                 % create empty current array for 0.025 s 
w2=zeros(241,1);                % create empty current array for 0.0025 s 
vd=zeros(25,1);                 % create empty voltage array for 0.025 s 
vd2=zeros(241,1);               % create empty voltage array for 0.025 s 
w1(1)=h*Vs/L;                   % initial diode current value for 0.025 s
w2(1)=h2*Vs/L;                  % initial diode current value for 0.0025 s
d=0.0:0.025:0.6;                % delta(t) = 0.025 s
z=0.0:0.025:1.3;                % voltage(t) for 0.025 s 
d2=0.0:0.0025:0.6;              % delta(t) = 0.0025 s
z2=0.0:0.0025:1.3;              % voltage(t) for 0.0025 s
vd(1)=0;                        %initial value of diode voltage for 0.025 s
vd2(1)=0;                       %initial value of diode voltage for 0.0025 s

for i=1:N                       % delta(t) = 0.025 s for iteration number is 24
 
 w1(i+1) = w1(i)+h*((Vs-fvd(w1(i))-w1(i)*R)/L);    % euler method for current
 vd(i+1) = fvd(w1(i));
 
end

for i=1:N2                      % delta(t) = 0.0025 s for iteration number is 240
 
 w2(i+1) = w2(i)+h2*((Vs-fvd(w2(i))-w2(i)*R)/L);   % euler method for current 
 vd2(i+1) = fvd(w2(i));
 
end

plot(z,y(z));                               % voltage - current graph 
hold on
plot(vol,cur,'x');                          % voltage - current graph 
ylabel('Current (A)');
xlabel('Voltage (V)');
title('Current - Voltage Graph');

figure();

plot(d,vd);                                 % diode voltage - time graph for 0.025 s
hold on
plot(d2,vd2);                               % diode voltage - time graph for 0.0025 s
xlabel('Time(s)');
ylabel('Diode Voltage (V)');
title('Diode Voltage - Time Graph');
legend('For 0.025 s','For 0.0025 s');

figure();

plot(d,w1);                                 % diode current - time graph for 0.025 s
hold on
plot(d2,w2);                                % diode current - time graph for 0.0025 s
xlabel('Time(s)');
ylabel('Diode Current (A)');
title('Diode Current - Time Graph');
legend('For 0.025 s','For 0.0025 s');

figure();

plot(d,Vs-fvd(w1)-w1*R);                    % v2(t) inductor voltage - time graph for 0.025 s
hold on
plot(d2,Vs-fvd(w2)-w2*R);                   % v2(t) inductor voltage - time graph for 0.0025 s
xlabel('Time(s)');
ylabel('V2 Voltage (V)');
title('V2 Voltage - Time Graph');
legend('For 0.025 s','For 0.0025 s');

figure();

plot(d,w1*R);                               % v1(t) resistor voltage - time graph for 0.025 s
hold on
plot(d2,w2*R);                              % v1(t) resistor voltage - time graph for 0.0025 s
xlabel('Time(s)');
ylabel('V1 Voltage (V)');
title('V1 Voltage - Time Graph');
legend('For 0.025 s','For 0.0025 s');


