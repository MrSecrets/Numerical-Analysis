function x=GuassElimination(A,b)

s_A = size(A);
if s_A(1) ~= s_A(2)
    disp('Matrix A is not a square matrix');
elseif s_A(1) ~= size(b,1)
    disp('Matrix b dimensions not compatible with A');
else
    N = s_A(1);
    
    for i = 1:N-1
        temp_index=i;
        for k=i+1:N
            if abs(A(i,i))<abs(A(k,i))                
                temp_index=k;                
            end
        end
        temp_row_A = A(i,:);
        temp_row_b = b(i);
        A(i,:) = A(temp_index,:);
        b(i) = b(ktemp_index);
        A(temp_index,:) = temp_row_A;
        b(temp_index) = temp_row_b;
        
        for j = i+1:N
            m = -1*A(j,i)/A(i,i);
            A(j,:) = A(j,:) + m*A(i,:);
            b(j) = b(j) + m*b(i);
%             for k =i:N
%                 A(j,k) = A(j,k) + m*A(i,k);
%             end
        end
    end
    x = zeros(N,1);
    for i = N:-1:1
        sum = 0;
        for j = N:-1:i
            sum =sum + A(i,j)*x(j);
        end
        x(i) = (b(i) - sum)/A(i,j);
    end
end
        

            
                
                