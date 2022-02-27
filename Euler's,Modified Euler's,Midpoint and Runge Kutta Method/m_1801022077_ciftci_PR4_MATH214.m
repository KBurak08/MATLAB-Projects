clear all
clc

i0=0.1; % current at t=0
Vs=12; % dc power source
L=0.98; % inductor
R=14.2; % resistor
h=0.05; % time interval 1
h2=0.025; %time interval 2
N=12; % number of iteration 1
N2=24; % number of iteration 2

i1=zeros(1,N);
i2=zeros(1,N);
i3=zeros(1,N);
v1=zeros(1,N);
t1=zeros(1,N);

irk=zeros(1,N+1);
vrk=zeros(1,N+1);
t2=zeros(1,N+1);

is=zeros(1,N2);
i2s=zeros(1,N2);
i3s=zeros(1,N2);
vss=zeros(1,N2);
ts=zeros(1,N2);

irks=zeros(1,N2+1);
vrks=zeros(1,N2+1);
t2s=zeros(1,N2+1);

for a=1:N
vrk(a)=Vs;
end

for a=1:N2
vrks(a)=Vs;
end

i1(1)=i0;
irk(1)=i0;
i2(1)=i0;
i3(1)=i0;
t1(1)=0;
is(1)=i0;
irks(1)=i0;
i2s(1)=i0;
i3s(1)=i0;

for a=1:12
v1(a)=Vs;
end
t1(1)=0;

for b=1:24
vss(b)=Vs;
end

rk11=0;
rk12=0;
rk21=0;
rk22=0;
rk41=0;
rk31=0;
rk32=0;
rk42=0;
rk11s=0;
rk12s=0;
rk21s=0;
rk22s=0;
rk41s=0;
rk31s=0;
rk32s=0;
rk42s=0;

for i=1:N
    
 t1(i+1)=i*h; 

 i1(i+1)=i1(i)+(-R/L*i1(i)+1/L*v1(i))*h; %euler method

 i2(i+1)=i2(i)+((-R/L*i2(i)+1/L*v1(i))+(-R/L*i2(i)+1/L*v1(i)+(-R/L*i2(i)+1/L*v1(i))*h))*h/2; %modified euler method

 i3(i+1)=i3(i)+(-R/L*i3(i)*h+1/L*v1(i)*h+(-R/L*i3(i)+1/L*v1(i)))*h; %midpoint method

 rk11=-R/L*irk(i)+1/L*vrk(i)+1/L; %first derivative runge kutta
 rk12=1/irk(i);
 rk21=-R/L*(irk(i)+h/2*rk11/2)+1/L*(vrk(i)+h/2*rk12/2)+1/L; %second derivative runge kutta
 rk22=1/(irk(i)+h/2*rk11/2);
 rk31=-R/L*(irk(i)+h/2*rk11/2)+1/L*(vrk(i)+h/2*rk12/2)+1/L*(irk(i)+h/2*rk21/2)+1/L*(vrk(i)+h/2*rk22/2)+1/L; %third derivative runge kutta
 rk32=1/(irk(i)+h/2*rk11/2+irk(i)+h/2*rk21/2);
 rk41=-R/L*(irk(i+1)+h*rk11)+1/L*(vrk(i+1)+h*rk12)+1/L*(irk(i+1)+h*rk21)+1/L*(vrk(i+1)+h*rk22)+1/L*(irk(i+1)+h*rk31)+1/L*(vrk(i+1)+h*rk32)+1/L; %four derivative runge kutta
 rk42=1/(irk(i+1)+h*rk11+irk(i+1)+h*rk21+irk(i+1)+h*rk31);
 
 irk(i+1)=irk(i)+h*(0.5*rk11+rk21+rk31+0.5*rk41)/35; %runge kutta method

end

plot(t1,i1);
hold on
plot(t1,i2);
hold on
plot(t1,i3);
hold on
plot(t1,irk);
hold on 
legend('Euler','Modified Euler','Midpoint','Runge-Kutta');
xlabel('Time(s)');
ylabel('Current(A)');
figure;

for i=1:N2
    
 ts(i+1)=i*h2; 

 is(i+1)=is(i)+(-R/L*is(i)+1/L*vss(i))*h2; %euler method

 i2s(i+1)=i2s(i)+((-R/L*i2s(i)+1/L*vss(i))+(-R/L*i2s(i)+1/L*vss(i)+(-R/L*i2s(i)+1/L*vss(i))*h2))*h2/2; %modified euler method

 i3s(i+1)=i3s(i)+(-R/L*i3s(i)*h2+1/L*vss(i)*h2+(-R/L*i3s(i)+1/L*vss(i)))*h2; %midpoint method

 rk11s=-R/L*irks(i)+1/L*vrks(i)+1/L; %first derivative runge kutta
 rk12s=1/irks(i);
 rk21s=-R/L*(irks(i)+h2/2*rk11s/2)+1/L*(vrks(i)+h2/2*rk12s/2)+1/L; %second derivative runge kutta
 rk22s=1/(irks(i)+h2/2*rk11s/2);
 rk31s=-R/L*(irks(i)+h2/2*rk11s/2)+1/L*(vrks(i)+h2/2*rk12s/2)+1/L*(irks(i)+h2/2*rk21s/2)+1/L*(vrks(i)+h2/2*rk22s/2)+1/L; %third derivative runge kutta
 rk32s=1/(irks(i)+h2/2*rk11/2+irks(i)+h2/2*rk21/2);
 rk41s=-R/L*(irks(i+1)+h2*rk11)+1/L*(vrks(i+1)+h2*rk12)+1/L*(irks(i+1)+h2*rk21)+1/L*(vrks(i+1)+h2*rk22)+1/L*(irks(i+1)+h2*rk31s)+1/L*(vrks(i+1)+h2*rk32s)+1/L; %four derivative runge kutta
 rk42s=1/(irks(i+1)+h2*rk11+irks(i+1)+h2*rk21+irks(i+1)+h2*rk31s);
 
 irks(i+1)=irks(i)+h2*(0.5*rk11s+rk21s+rk31s+0.5*rk41s)/35; %runge kutta method
 
end

plot(ts,is);
hold on
plot(ts,i2s);
hold on
plot(ts,i3s);
hold on
plot(ts,irks);
hold on 
legend('Euler','Modified Euler','Midpoint','Runge-Kutta');
xlabel('Time(s)');
ylabel('Current(A)');

