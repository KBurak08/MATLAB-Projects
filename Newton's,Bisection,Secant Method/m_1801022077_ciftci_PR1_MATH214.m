clear all

y = @(x) 8.98*10^9*[(13*(x+7))/(abs(x+7)^3)+(9*(x+4))/(abs(x+4)^3)+(6*(x-11))/(abs(x-11)^3)+(3*(x-14))/(abs(x-14)^3)]; % the given equation
dy = @(x) 8.98*10^9*[-(26)/((x+7)^2*abs(x+7))-(18)/((x+4)^2*abs(x+4))-(12)/((x-11)^2*abs(x-11))-(6)/((x-14)^2*abs(x-14))]; %  differential the given equation

% Bisection Method 

xi = input('Enter the first value for bisection method: '); % first x value
xf = input('Enter the second value for bisection method: '); % second x value

if y(xi)*y(xf) > 0  
  fprintf('Error!!!.Bisection method fails.No roots found.\n');
  return
end

if y(xi) == 0   %find roots
  fprintf('Roots found:\n')
  return
  
elseif y(xf) == 0  %find roots
  fprintf('Roots found:\n')
  return
end

ite = 0; % iteration
tol = 1.e-10; % tolerance

while abs(xi-xf)/abs(xi) > tol 
  xt = (xi+xf)/2; % bisection method formula
  it = xt;
  
  xabso = abs(xi-xf); % absolute error formula  
  xrelo = abs(xi-xf)/abs(xi); % relative error formula
  
  for count = 0:ite % iteration value loop
  end
  fprintf('%d iteration value: %f\n',count,it)
  fprintf('Absolute Error: %f\n',xabso)
  fprintf('Relative Error: %f\n',xrelo)
  
  if y(xi)*y(xt) < 0
    xf = xt;
  else
    xi = xt;
  end
  ite = ite+1;
end
  fprintf('The root calculated by bisection method: %f\n',xt);
  fprintf('The method failed after iteration: %d\n',ite);

% Secant Method 
  
x(1) = input('Enter the first value for secant method: '); % first x value
x(2) = input('Enter the second value for secant method: '); % second x value

tol = 1e-10; % tolerance
itera = 0; % iteration

if x(1)*x(2) > 0    
   fprintf('Error!!!Secant method fails.No roots found.')
   return 
end
 
 xabsol = abs(x(1)-x(2)); % absolute error formula
 xrelol = abs(x(1)-x(2))/abs(x(1)); % relative error formula
 
for i=2:100
   x(i+1) = x(i) - (y(x(i)))*((x(i) - x(i-1))/(y(x(i)) - y(x(i-1)))); % secant method formula
   itera=itera+1;
    
    if abs((x(i+1)-x(i))/x(i+1))*100 < tol
        fprintf('The root calculated by secant method: %f\n',x(i));
        fprintf('The method failed after iteration %d\n',itera);
        break
    end
end

% Newton Rapshon Method

a = input('Enter guess a number = '); % initial guess number

tol = 1e-10; % tolerance
iter = 0; % iteration

while iter < 100
    
    p = a -(y(a)/dy(a)); % newton rapshon method formula
    
    if abs(p-a) < tol
    break  
    end
    
    iter = iter +1;
    a = p;
end

fprintf('The root calculated by newton method: %f\n',p);
fprintf('The method failed after iteration %d',iter); 
