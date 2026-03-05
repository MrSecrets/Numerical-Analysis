%  example _fun
function[r,N] = example_fun(s)
N = length(s);
% or you can N=size(s,1)
sum = 0;
for i =1:N
    sum =sum +s(i)^2;
end
r= sqrt(sum); %return output
