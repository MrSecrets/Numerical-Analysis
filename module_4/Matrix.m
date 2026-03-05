function [A,b] = Matrix(N,v,k,C0)

A=zeros(N);
b=zeros(N,1);

global dz 

A(1,1)=-1*k;
A(2,1)=(-1*v)/(2*dz);

for i=2:N
    A(i,i)=-1*k;
    A(i+1,i)=(-1*v)/(2*dz);
    A(i-1,i)=v/(2*dz);
end

A(N,N)=(-1*k-(v/dz));
A(N-1,N)=v/(dz);

b(1)=(v*C0)/(2*dz);

