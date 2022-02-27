clear all 
clc

dis = dlmread('pr5data.dat' , '' , [0,0,10,0]); % veriler okundu 
sig = dlmread('pr5data.dat' , '' , [0,1,10,1]); % veriler okundu 
 
xi = 0;
xi2 = 0;
xi3 = 0;
xi4 = 0;
xi5 = 0;
xi6 = 0;
yi=0;
m=11;
xcarpma = 0;

for a=1:m
    
xi = xi + dis(a); %xi toplam

end

for i=1:m
  
xi2 = xi2 + dis(i)^2; %xi^2 toplamı

end

for i=1:m
  
xi3 = xi3 + dis(i)^3;  %xi^3 toplamı

end

for i=1:m
  
xi4 = xi4 + dis(i)^4; %xi^4 toplamı 

end

for i=1:m
  
xi5 = xi5 + dis(i)^5; %xi^5 toplamı

end

for i=1:m
  
xi6 = xi6 + dis(i)^6; %xi^6toplamı

end

for i=1:m
  
yi = yi + sig(i);

end

for i=1:m
    
xcarpma = xcarpma + dis(i)*sig(i);
    
end

a0 = (xi2*yi-xcarpma*xi)/(m*xi2-(xi^2));

a1 = (m*xcarpma-xi*yi)/(m*xi2-(xi^2));

y = @(x)  a1*x+a0; %ax+b denklem

f = zeros(11,1);

for a=1:m
    
    f(a) = y(dis(a));

end

plot(dis,f);
xlabel('Distance(m)');
ylabel('Voltage(V)');
hold on
plot(dis,sig);

yii=0;
yixi=0;
yixi2=0;
yixi3=0;

m = 11;

for i=1:m
    
    yii = yii + sig(i);     %yi
    
end

for i=1:m
    
    yixi = yixi + dis(i)*sig(i) ;    %xi*yi
    
end

for i=1:m
    
    yixi2 = yixi2 + dis(i)^2*sig(i);   %xi^2+yi
    
end

for i=1:m
    
    yixi3 = yixi3 + dis(i)^3*sig(i);  %xi^3+yi
    
end

mm = 11;

pp2 = zeros(11,1);

p2_1 = [mm xi xi2 ; xi xi2 xi3 ; xi2 xi3 xi4];  %3x3 matrix
p2_2 = [pp2(1,1) ; pp2(2,1) ; pp2(3,1)];
p2_3 = [yii ; yixi ; yixi2];
    
p2inv = inv(p2_1); %inverse matrix

psonuc = p2inv*p2_3;

a01= 0.070946826867136;         %a0
a02= -5.312092864336038e-05;    %a1
a03= 1.262380069930239e-08;     %a2

y2 = @(x)  a01+a02*x+a03*x^2; %2.derece polinom denklemi

f = zeros(11,1);

for a=1:m
    
    f(a) = y2(dis(a));

end
figure();
plot(dis,f);
xlabel('Distance(m)');
ylabel('Voltage(V)');
hold on
plot(dis,sig);

mm = 11;

pp3 = zeros(11,1);

p3_1 = [mm xi xi2 xi3 ; xi xi2 xi3 xi4 ; xi2 xi3 xi4 xi5 ; xi3 xi4 xi5 xi6];   %4x4 matrix
p3_2 = [pp3(1,1) ; pp3(2,1) ; pp3(3,1) ; pp3(4,1)];
p3_3 = [yii ; yixi ; yixi2 ; yixi3];
    
p3inv = inv(p3_1); %inverse matrix

p3sonuc = p3inv*p3_3;

a31= 0.061828754205294;           %a0
a32= -3.384037087850178e-05;      %a1
a33= -5.780419583744853e-10;      %a2
a34 = 2.933742812688523e-12;      %a3

y3 = @(x)  a31+a32*x+a33*x^2+a34*x^3;  %3.derece polinom denklemi

f = zeros(11,1);

for a=1:mm
    
    f(a) = y3(dis(a));

end

figure();
plot(dis,f);
xlabel('Distance(m)');
ylabel('Voltage(V)');
hold on
plot(dis,sig);


