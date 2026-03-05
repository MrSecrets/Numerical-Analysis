% basic introduction to matlab %

% comments are done by '%'
clc %  'clc' clears the command window same ass clear in bash
clear variables % clears the entire workspace
close all % closes open figures

%  sassignment %
a = 1  % scalar assignment and then printing
a = 1; % ';' suppressess printing the result

%  vector assignment %

b = [1 2 3 ]
c = [1;2;3]
v = [1, 2 ; 3, 4]
v = [1 2 ; 3 4] % are the same space can be used instead of comma
d = zeros(3,2) % same as that of a numpy array
b = [1 2 3]' % " ' " creates a transpose
%   error : vertcat = vertical catanation
d = ones(4,7)
f = (1:4:10)'% f=(initial:increment:limit) creates a matrix that has 
            % the 'initial' value with an 'increment' 
             % till it is less than the limit.

% sixe of matrix %
size(f) % rows x cols

% conctaanation %
h=[b;c] %vertical
h=[b c] % horizontal

%  assess elements of matrix
h(2,1)
h(2,:)
h(:,2)
h(:,2:1)

%matrix multiplication

% b*c %dimension should match
% h^2 %square of matrix
k=h.^2 % square of element 
     % ' . ' changes into an elemnt based operation
     
     
%   if else constuct
if i<5 
    disp([num2str(i) ' is less than 5']);
elseif i==5
    dip([num2str(i) ' is equal to 5']);
else
    disp([num2srt(i) ' is greater than 5']);
end

%  for loop %

for m= 10:-2:1
    disp(m);
    if m<=5
        break
    end
end

%  while loop %

n =0;
p=10;
while n<5 &&(p>5)
    disp([n p]);
    n=n+1;
    p=p+1;
end            % avoid using while loop it may not stop if you forgot end clause 
                 
%   operation
 
%  h(1,:) = h(1,:) +h(2,4) % operation over entire row or column

%   user defined function
 q=example_fun(b); 

fun =@example_fun;
r=fun(b);

% plot

x=1:10
y=x.^7 +1 ;
plot (x,y);  hold on; % matlab will hold the previous plot and plot the next one on it 
%            figure %creates a new extra plot 

% plot(x,x);
plot (x,x,'r') % r is the code for colour red


    
        