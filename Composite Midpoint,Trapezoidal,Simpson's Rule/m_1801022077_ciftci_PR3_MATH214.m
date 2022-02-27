clear all
clc

A = dlmread('pr3data.dat' , '' , 0 , 0);
V = dlmread('pr3data.dat' , '' , 0 , 2);
I = dlmread('pr3data.dat' , '' , [0,1,40,1]);
T = dlmread('pr3data.dat' , '' , [0,0,40,0]);

figure(1);
plot(T,I);
xlabel('Time');
ylabel('Current');

figure(2);

plot(T,V);
xlabel('Time');
ylabel('Voltage');

figure(3);

P = I.*V;
plot(T,P);
xlabel('Time');
ylabel('Power');


L = 0.1;
W=zeros(41,1);
q=T;

for q=1:41
    
 W(q) = W(q)+1/2*L*I(q).^2;
 
end

%cps %composite simpson's rule

I2 = dlmread('pr3data.dat' , '' , [0,1,19,1]);
V2 = dlmread('pr3data.dat' , '' , [0,1,19,1]);

P2=I2.*V2;
cps = P2;

n = 20;
h = 0.05;

s=0;
g=0;

for i=1:19
    
    s = s + P2(i);
    
end

for i=1:20
    
    g = g + P2(i);
    
end

thalf = dlmread('pr3data.dat' , '' , [0,0,19,0]);
th = thalf;

for th=1:20
    
cps(th) = (cps(th)+((P2(1)+P2(20)+2*s+4*g)))*(h/3); %composite simpson's rule formula

end

%cpm %composite midpoint rule

cpm = P2;

n = 20;
h = 0.05;

v=0;

for i=1:20
    
    v = v + P2(i);
    
end

u = thalf;

for u=1:20
    
 cpm(u) = (cpm(u)+(v))*(2*h); %composite midpoint rule formula
 
end

%cpt %composite trapezodial rule

cpt = P;

n = 40;
h = 0.025;
z=0;

for i=1:40
    
    z = z + P(i);
    
end
 
r=T;

for r=1:40

cpt(r) = (cpt(r)+(P(1)+P(40)+2*z))*(h/2); %composite trapezodial rule formula

end
    
    

