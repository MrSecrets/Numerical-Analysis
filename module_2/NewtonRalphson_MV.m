function x1=Newton(f,x0,n,maxit)
delta=0.0001;
x1=x0;
for k=1:maxit
    J=zeros(n);
    x0=x1;
    for i=1:n
        for j=1:n
            xj1=x0;
            xj2=x0;
            xj1(j)=x0(j)+delta;
            xj2(j)=x0(j)-delta;
            a1=f(xj1);
            a2=f(xj2);
            J(i,j)=(a1(i)-a2(i))/(2*delta);
        end
    end
    b=-f(x0);
    A=J;
    dx=inv(A)*b;
    x1=x0+dx;
    if (abs((norm(x1)-norm(x0))/(norm(x1))))*100<0.00001
        disp(['Convergence achieved in' num2str(i) 'iterations'])
        break;
    else
        if i==maxit
            disp('maximum iterations reached without satisfying convergence')
        end
    end
end

