model epid
  parameter Real a = 0.01;
  parameter Real b = 0.02;
  parameter Real N = 11000;
  parameter Real I0 = 111; 
 
  parameter Real R0 =11;
  parameter Real S0 =N-I0-R0;
  
  Real S(start = S0);
  Real I(start = I0);
  Real R(start = R0);
    
equation
  der(S) = 0;
  der(I)=-b*I;
  der(R)=b*I;
end epid;

model epid2
  parameter Real a = 0.01;
  parameter Real b = 0.02;
  parameter Real N = 11000;
  parameter Real I0 = 111; 
 
  parameter Real R0 =11;
  parameter Real S0 =N-I0-R0;
  
  Real S(start = S0);
  Real I(start = I0);
    
equation
  der(S) = -a*S;
  der(I)=a*S-b*I;
der(R)=b*I
end epid2;