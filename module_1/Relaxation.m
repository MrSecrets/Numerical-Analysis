function x =Relaxation(A,b,x0,iter_max,rel_error_tol)

s_A = size(A)
N = s_A(1)
lambda = 0.5;
if nargin < 3
    disp('initial guess not provided. Using default initial guess of unity vector');
    x0 = ones(N,1);
    iter_max = 100;
    rel_error_tol = 1e-3
elseif nargin <4
    iter_max = 100;
    rel_error_tol = 1e-3;
elseif nargin < 5
    rel_error_tol = 1e-3;
end

if s_A(1) ~= s_A(2)
    disp('Marix A is not a square matrix');
elseif s_A(1) ~=size(b,1)
    disp('Matrix b dimensions not compatible with A');
elseif s_A(1) ~= size(x0,1)
    disp('Matrix x0 dimensions not compatible with A');
else
    for i = 1:N
        if A(i,i) ==0
            row_swap = false;
            for j =i+1:N
                if A(j,i) ~= 0
                    row_swap = true;
                    temp_A = A(j,:);
                    temp_b = b(j);
                    A(j,:) = A(i,:);
                    b(j) = b(i);
                    A(i,:) = temp_A;
                    b(i) = temp_b;
                    break;
                end
            end
            if ~row_swap
                for j= 1:i-1
                    if A(j,i) ~= 0 && A(i,j) ~=0
                        temp_A = A(j,:);
                        temp_b = b(j);
                        A(j,:) = A(i,:);
                        b(j) = b(i);
                        A(i,:) = temp_A;
                        b(i) = temp_b;
                        break
                    end
                end
            end
        end
    end
    x=x0
    for i = i:iter_max
        for j = 1:N
            sum = 0;
            for k = 1:N
                if k ~= j
                    sum = sum +A(j,k)*x(k);
                end
            end
            x(j) = lambda*x(j) + (1-lambda)*(b(j) - sum)/A(j,j);
        end
        res = b - A*x;
        rel_error = norm(res)/norm(b);
         if rel_error < rel_error_tol
             disp(['convergence achieved in ' num2str(i) ' iterations']);
             break;
         else
             if i == iter_max
                 disp('maximum iterations reached without satisfying convergence criteria');
             else
                 x0=x;
             end
         end
    end
end
