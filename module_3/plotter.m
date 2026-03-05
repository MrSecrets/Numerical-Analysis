
fun = @CSTR;
Ca0 = 1000;
Nf = 5;
h = 0.0001;
Ca = Ca0*ones(5,1);

[N,C] = EulerImproved(fun,Ca,Nf,h);
for i = 1:5
  plot(N,C(:,i)); hold on;
end

fun = @eqn;

% [t1,x1] = EulerImproved(fun,0.1,10,0.01);
[t2,x2] = EulerExplicit(fun,0.1,10,0.01);
 
%  plot(t1,x1); hold on
%  plot(t2,x2); hold on
%  plot(t2, exp(-0.1*t2));

