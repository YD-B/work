model lab3
  parameter Real a = 0.333;
  parameter Real b = 0.777;
  parameter Real c = 0.5;
  parameter Real h = 0.65;
  
  parameter Real x0 =10000;
  parameter Real y0 =29000;
  
  Real x(start = x0);
  Real y(start = y0);
equation
  der(x) = -a*x - b*y + 1.6*sin(time);
  der(y) = -c*x - h*y + 1.7*cos(time+2);
end lab3;
