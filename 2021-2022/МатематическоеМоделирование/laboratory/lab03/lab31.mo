model lab31
  parameter Real a = 0.343;
  parameter Real b = 0.815;
  parameter Real c = 0.227;
  parameter Real h = 0.815;
  
  parameter Real x0 =10000;
  parameter Real y0 =29000;
  
  Real x(start = x0);
  Real y(start = y0);
equation
  der(x) = -a*x - b*y + sin(2*time)+1;
  der(y) = -c*x*y - h*y + cos(10*time)+1;
end lab31;
