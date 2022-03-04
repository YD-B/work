model l4
  parameter Real w = 2.5;
  parameter Real g = 0; 
  parameter Real x0 =-1;
  parameter Real y0 =2;
  
  Real x(start = x0);
  Real y(start = y0);
    
equation
  der(x) = y;
  der(y)=-g*y-w*w*x;
end l4;
