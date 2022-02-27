clear all
clc

load current1.dat
load current2.dat
load current3.dat
load current4.dat

cur1 = ones(9,2);
cur2 = ones(13,2);
cur3 = ones(25,2);
cur4 = ones(61,2);

%forward difference method

for a=1:9
for b=1:2
    
cur1(a,b) = current1(a,b);

end
end

for w=1:8
    h1f(w,1) = cur1(2,1);
    p1(w,1) = (cur1((w+1),2)-cur1(w,2))/h1f(w,1); %forward difference method formula
    p1(w,1);
    p1(9,1)=0;
    h1f(9,1)=0;
end

for a=1:13
for b=1:2
    
cur2(a,b) = current2(a,b);
end
end

for w=1:12
    h2f(w,1) = cur2(2,1);
    p2(w,1) = (cur2((w+1),2)-cur2(w,2))/h2f(w,1); %forward difference method formula
    p2(w,1);
    p2(13,1)=0;
end

for a=1:25
for b=1:2
    
cur3(a,b) = current3(a,b);

end
end

for w=1:24
    h3f(w,1) = cur3(2,1);
    p3(w,1) = (cur3((w+1),2)-cur3(w,2))/h3f(w,1); %forward difference method formula
    p3(w,1);
    p3(25,1)=0;
end

for a=1:61
for b=1:2
    
cur4(a,b) = current4(a,b);

end
end

for w=1:60
    h4f(w,1) = cur4(2,1);
    p4(w,1) = (cur4((w+1),2)-cur4(w,2))/h4f(w,1); %forward difference method formula
    p4(w,1);
    p4(61,1)=0;
end

%backward difference method

a=9;
b=2;

while b>1

while a>1
    
cur1(a,b) = current1(a,b);

a=a-1;
end
b=b-1;
end

w=9;

while w>1
    h1b(w,1) = cur1(2,1);
    y1(w,1) = ((cur1(w,2))-cur1((w-1),2))/h1b(w,1); %backward difference method formula
    w=w-1;
    y1(w,1);
end

a=13;
b=2;

while b>1

while a>1
    
cur2(a,b) = current2(a,b);

a=a-1;
end
b=b-1;
end

w=13;

while w>1
    h2b(w,1) = cur2(2,1);
    y2(w,1) = ((cur2(w,2))-cur2((w-1),2))/h2b(w,1); %backward difference method formula
    w=w-1;
    y2(w,1);
end

a=25;
b=2;

while b>1

while a>1
    
cur3(a,b) = current3(a,b);

a=a-1;
end
b=b-1;
end

w=25;

while w>1
    h3b(w,1) = cur3(2,1);
    y3(w,1) = ((cur3(w,2))-cur3((w-1),2))/h3b(w,1); %backward difference method formula
    w=w-1;
    y3(w,1);
end

a=61;
b=2;

while b>1

while a>1
    
cur4(a,b) = current4(a,b);

a=a-1;
end
b=b-1;
end

w=61;

while w>1
    h4b(w,1) = cur4(2,1);
    y4(w,1) = ((cur4(w,2))-cur4((w-1),2))/h4b(w,1); %backward difference method formula
    w=w-1;
    y4(w,1);
end

%midpoint method

a=1;
b=1;

while b<2

while a<9
    
cur1(a,b) = current1(a,b);

a=a+1;
end
b=b+1;
end

w=2;

while w<9
    h1m(w,1) = cur1(2,1);
    v1(w,1) = ((cur1(w+1,2))-cur1((w-1),2))/2*h1m(w,1); %midpoint method formula
    w=w+1;
    v1(9,1)=0;
end

a=1;
b=1;

while b<2

while a<13
    
cur2(a,b) = current2(a,b);

a=a+1;
end
b=b+1;
end

w=2;

while w<13
    h2m(w,1) = cur2(2,1);
    v2(w,1) = ((cur2(w+1,2))-cur2((w-1),2))/2*h2m(w,1); %midpoint method formula
    w=w+1;
    v2(13,1)=0;
end

a=1;
b=1;

while b<2

while a<25
    
cur3(a,b) = current3(a,b);

a=a+1;
end
b=b+1;
end

w=2;

while w<25
    h3m(w,1) = cur3(2,1);
    v3(w,1) = ((cur3(w+1,2))-cur3((w-1),2))/2*h3m(w,1); %midpoint method formula
    w=w+1;
    v3(25,1)=0;
end

a=1;
b=1;

while b<2

while a<61
    
cur4(a,b) = current4(a,b);

a=a+1;
end
b=b+1;
end

w=2;

while w<61
    h4m(w,1) = cur4(2,1);
    v4(w,1) = ((cur4(w+1,2))-cur4((w-1),2))/2*h4m(w,1); %midpoint method formula
    w=w+1;
    v4(61,1)=0;
end

L = 0.98;
R = 14.2;

%forward inductance

for zf=1:9
    
 Ezf(zf,1) = L*p1(zf,1)+R*current1(zf,2); % Inductance formula
 
end

 for xf=1:13
     
 Exf(xf,1) = L*p2(xf,1)+R*current2(xf,2); % Inductance formula
  
end

 for ff=1:25
     
 Eff(ff,1) = L*p3(ff,1)+R*current3(ff,2); % Inductance formula
  
 end
 
 for gf=1:61
      
  Egf(gf,1) = L*p4(gf,1)+R*current4(gf,2); % Inductance formula
  
 end
 
%backward inductance 
 
 for zb=1:9
      
  Ezb(zb,1) = L*y1(zb,1)+R*current1(zb,2); % Inductance formula
   
  end
 
  for xb=1:13
      
  Exb(xb,1) = L*y2(xb,1)+R*current2(xb,2); % Inductance formula
   
  end
  
  for fb=1:25
      
  Efb(fb,1) = L*y3(fb,1)+R*current3(fb,2); % Inductance formula
   
  end
  
  for gb=1:61
      
  Egb(gb,1) = L*y4(gb,1)+R*current4(gb,2); % Inductance formula
   
  end
  
  %midpoint inductance
  
  for zm=1:9
      
  Ezm(zm,1) = L*v1(zm,1)+R*current1(zm,2); % Inductance formula
  
  end
 
  for xm=1:13
      
  Exm(xm,1) = L*v2(xm,1)+R*current2(xm,2); % Inductance formula
   
  end
  
  for fm=1:25
      
  Efm(fm,1) = L*v3(fm,1)+R*current3(fm,2); % Inductance formula
   
  end
  
  for gm=1:61
      
  Egm(gm,1) = L*v4(gm,1)+R*current4(gm,2); % Inductance formula
   
  end
 
   %forward plots
   
   A=h1f(:,1);
   A=Ezf(:,1);
   plot(A);
   xlabel('Time');
   ylabel('Voltage');
   title('Current1.dat');
   
   figure();
   
   B=h2f(:,1);
   B=Exf(:,1);
   plot(B);
   xlabel('Time');
   ylabel('Voltage');
   title('Current2.dat');
   
   figure();
   
   C=h3f(:,1);
   C=Eff(:,1);
   plot(C);
   xlabel('Time');
   ylabel('Voltage');
   title('Current3.dat');
   
   figure();
   
   D=h4f(:,1);
   D=Egf(:,1);
   plot(D);
   xlabel('Time');
   ylabel('Voltage');
   title('Current4.dat');
   
   figure();
   
  %backward plots
  
  E=h1b(:,1);
  E=Ezb(:,1);
  plot(E);
  xlabel('Time');
  ylabel('Voltage');
  title('Current1.dat');

  figure();
  
  F=h2b(:,1);
  F=Exb(:,1);
  plot(F);
  xlabel('Time');
  ylabel('Voltage');
  title('Current2.dat');
  
  figure();
  
  G=h3b(:,1);
  G=Efb(:,1);
  plot(G);
  xlabel('Time');
  ylabel('Voltage');
  title('Current3.dat');
  
  figure();
  
  H=h4b(:,1);
  H=Egb(:,1);
  plot(H);
  xlabel('Time');
  ylabel('Voltage');
  title('Current4.dat');
   
  figure();
   
  %midpoint plots
   
  T=h1m(:,1);
  T=Ezm(:,1);
  plot(T);
  xlabel('Time');
  ylabel('Voltage');
  title('Current1.dat');
  
  figure();
  
  P=h2m(:,1);
  P=Exm(:,1);
  plot(P);
  xlabel('Time');
  ylabel('Voltage');
  title('Current2.dat');
  
  figure();
  
  Q=h3m(:,1);
  Q=Efm(:,1);
  plot(Q);
  xlabel('Time');
  ylabel('Voltage');
  title('Current3.dat');
  
  figure();
  
  S=h4m(:,1);
  S=Egm(:,1);
  plot(S);
  xlabel('Time');
  ylabel('Voltage');
  title('Current4.dat');
   
  figure();

  % forward plots

    N=h1f(:,1);
    N=p1(:,1);
    plot(N);
    xlabel('Time');
    ylabel('Derivative Current');
    title('Current1.dat');

    figure();
    
    M=h2f(:,1);
    M=p2(:,1);
    plot(M);
    xlabel('Time');
    ylabel('Derivative Current');
    title('Current2.dat');
    
    figure();
    
    K=h3f(:,1);
    K=p3(:,1);
    plot(K);
    xlabel('Time');
    ylabel('Derivative Current');
    title('Current3.dat');
    
    figure();
    
    O=h4f(:,1);
    O=p4(:,1);
    plot(O);
    xlabel('Time');
    ylabel('Derivative Current');
    title('Current4.dat');
    
    figure();

  % backward plots
    
    W=h1b(:,1);
    W=y1(:,1);
    plot(W);
    xlabel('Time');
    ylabel('Derivative Current');
    title('Current1.dat');
    
    figure();
    
    X=h2b(:,1);
    X=y2(:,1);
    plot(X);
    xlabel('Time');
    ylabel('Derivative Current');
    title('Current2.dat');
    
    figure();
    
    V=h3b(:,1);
    V=y3(:,1);
    plot(V);
    xlabel('Time');
    ylabel('Derivative Current');
    title('Current3.dat');
    
    figure();
    
    U=h4b(:,1);
    U=y4(:,1);
    plot(U);
    xlabel('Time');
    ylabel('Derivative Current');
    title('Current4.dat');
    
    figure();
    
    %mid plots
    
    I=h1m(:,1);
    I=v1(:,1);
    plot(I);
    xlabel('Time');
    ylabel('Derivative Current');
    title('Current1.dat');
     
    figure();
     
    J=h2m(:,1);
    J=v2(:,1);
    plot(J);
    xlabel('Time');
    ylabel('Derivative Current');
    title('Current2.dat');
    
    figure();
     
    GS=h3m(:,1);
    GS=v3(:,1);
    plot(GS);
    xlabel('Time');
    ylabel('Derivative Current');
    title('Current3.dat');
     
    figure();
     
    GB=h4m(:,1);
    GB=v4(:,1);
    plot(GB);
    xlabel('Time');
    ylabel('Derivative Current');
    title('Current4.dat');
   