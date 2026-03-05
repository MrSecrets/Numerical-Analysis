function J = jacobian(fun,t,x)

n=length(x);
J=zeros(n,n);
dx=zeros(n,n);
delta = 0.001;

for i=1:n
    dx(i,i)=delta;
end

for j=1:n
    g1=fun(t,x+dx(:,j));
    g2=fun(t,x-dx(:,j));
    J(:,j)=(g1-g2)/(2*delta);
end