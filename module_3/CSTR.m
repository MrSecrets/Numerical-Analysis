function dCdt = CSTR(N,C)

k = 0.1;
Ca0 = 1000;
tau = 10;

dCdt(1) = (Ca0 - C(1))/tau - k*C(1)*C(1);
 
for i = 2:5
    dCdt(i) = (C(1) - C(2))/tau - k*C(2)*C(2);
end