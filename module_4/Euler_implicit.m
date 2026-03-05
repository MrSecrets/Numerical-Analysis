function [t,x]=Euler_implicit(fun,x0,tf,h)
iter_max=100;
error_tol = 0.001;
N=ceil(tf/h);

t=zeros(N+1,1);
x=zeros(N+1,length(x0));
x(1,:)=x0';
for i=1:N
    t(i+1)=t(i)+h;
    %non linear equation solver
    x_current=x(i,:)';
    x_guess=x_current+h*(fun(t(i),x_current));
    %disp(['For t= ' num2str(t(i+1))]);
    %Newton raphson
    for ii=1:iter_max
        N1=length(x_guess);
        f=x_current+(h)*(fun(t(i+1),x_guess))-x_guess;
        % jacobian
        J=(h)*(jacobian(fun,t(i+1),x_guess))-eye(N1);
        dx=J\-f;
        x_new=x_guess+dx;
        %convergence check
        er=norm(x_current+h*fun(t(i+1),x_new)-x_new);
        if er<error_tol
            break;
        else
            if i==iter_max
            else

                x_guess=x_new;
            end
        end
    end
    x(i+1,:)=x_new';
end