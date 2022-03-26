//1
model adv
parameter Real a10= 0.77;
parameter Real a20= 0.00017;
parameter Real N = 610;
parameter Real n0 = 10;

Real n (start = n0);
Real a1=a10;
Real a2=a20;

equation
  der(n) = (a1+a2*n)*(N-n);
end adv;


//2
model adv
parameter Real a10= 0.000055;
parameter Real a20= 0.29;
parameter Real N = 610;
parameter Real n0 = 10;

Real n (start = n0);
Real a1=a10;
Real a2=a20;

equation
  der(n) = (a1+a2*n)*(N-n);
end adv;

//3
model adv
parameter Real a10= 0.5;
parameter Real a20= 0.3;
parameter Real N = 610;
parameter Real n0 = 10;

Real n (start = n0);
Real a1;
Real a2;

equation
  a1=a10*time;
  a2=a20*time;
  der(n) = (a1+a2*n)*(N-n);

end adv;

