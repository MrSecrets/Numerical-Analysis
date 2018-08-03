function [A,b] = generateCSTR(N,k,C,t)

x = zeros(N,1);
x(1,1) = C/(t*k+1)

b= zeros(N,1);
b(1) = C;

A= zeros(N);
A(1,1) = t*k+1
for i = 2:N
    A(i,i)=t*k+1;
    A(i,i-1)=-1;
end

    
    
    
    