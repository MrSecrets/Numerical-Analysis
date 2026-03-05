function [t,x]=euler_explicit(fun,x0,tf,h)
N=ceil(tf/h);
t=zeros(N+1,1);
x=zeros(N+1,length(x0));
x(1,:)=x0';
for i=1:N
    t(i+1)=t(i)+h;
    x(i+1,:)=x(i,:)+h*fun(t(i),x(i,:))';
end