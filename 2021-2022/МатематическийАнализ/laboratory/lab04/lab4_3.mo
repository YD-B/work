model l43
  parameter Real w = sqrt(1);
  parameter Real g = 1; 
  parameter Real x0 =-1;
  parameter Real y0 =2;
  
  Real x(start = x0);
  Real y(start = y0);
  
equation
  der(x) = y;
  der(y)=-g*y-w*w*x-3*sin(time);
end l43;
