model pred_prey2
parameter Real a = -0.16;
parameter Real b = -0.045;
parameter Real c = -0.36;
parameter Real d = -0.033; 
 
parameter Real x0 =c/d;
parameter Real y0 =a/b;

Real x;
Real y;

initial equation
x=x0;
y = y0;
    
equation

 der(x) = a*x - b*x*y;
 der(y) = -c*y + d*x*y;
  
end pred_prey2;