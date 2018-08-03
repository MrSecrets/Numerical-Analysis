function x =LU(A,b)

s_A = size(A)

if s_A(1) ~= s_A(2)
    disp('Matrix A is not a square matrix');
elseif s_A(1) ~= size(b,1)
    disp('Matrix b dimensions not compatible with A');
else
    N = s_A(1);
    
    for i = 1:N-1
        for k=i:N
            if abs(A(i,i))<abs(A(k,i))
                temp_row_A = A(i,:);
                temp_row_b = b(i);
                A(i,:) = A(k,:);
                b(i) = b(k);
                A(k,:) = temp_row_A;
                b(k) = temp_row_b;
            end
        end
        
        U=A;
        L=A';
        for j = i+1:N
            L(j,:) = L(j,:) - L(i,:)*L(j,i)/L(i,i);
            U(j,:) = U(j,:) + U(i,:)*U(j,i)/U(i,j);
        end
%         U(i,:) = U(i,:)/U(i,i);
    end
    
    U = U';
    
    y = zeros(N,1);
    for i = N:-1:1
        sum = 0;
        for j = N:-1:i
            sum = sum + L(i,j)*y(j);
        end
        y(i) = (b(i) - sum)/L(i,j);
    end    
    y
    x = zeros(N,1);
    for i = N:-1:1
        sum=0;
        for j = N:-1:i
            sum = sum +U(i,j)*x(j);
        end
        x(i) = (b(i) - sum)/U(i,j);
    end
end
        