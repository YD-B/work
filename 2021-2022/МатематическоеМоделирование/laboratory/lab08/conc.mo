model conc

parameter Real M10 = 2.2;

parameter Real M20 = 1.5;

parameter Real p_cr= 17; //критическая стоимость продукта

parameter Real tau1= 13; // длительность производственного цикла фирмы 1

parameter Real tau2= 16; // длительность производственного цикла фирмы 2

parameter Real p1 = 10; // себестоимость продукта у фирмы 1

parameter Real p2 = 8; // себестоимость продукта у фирмы 2

parameter Real N = 20; // число потребителей производимого продукта.

parameter Real q = 1; // максимальная потребность одного человека в продукте в единицу времени


Real M1 (start = M10);

Real M2 (start = M20);

Real a1=p_cr/(tau1*tau1*p1*p1*N*q);

Real a2=p_cr/(tau2*tau2*p2*p2*N*q);

Real b=p_cr/(tau1*tau1*tau2*tau2*p1*p1*p2*p2*N*q);

Real c1=(p_cr-p1)/(tau1*p1);

Real c2=(p_cr-p2)/(tau2*p2);


equation

//case 1

  der(M1) = M1-(b/c1)*M1*M2-(a1/c1)*M1*M1;

  der(M2) = (c2/c1)*M2-(b/c1)*M1*M2-(a2/c1)*M2*M2;

//case 2

//  der(M1) = M1-((b/c1)+0.0014)*M1*M2-(a1/c1)*M1*M1;

//  der(M2) = (c2/c1)*M2-(b/c1)*M1*M2-(a2/c1)*M2*M2;

end conc;