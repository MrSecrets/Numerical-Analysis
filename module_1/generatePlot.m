function graph = generatePlot(N,k,C,t)



[A1,b1] = generateCSTR(N(1),k,C,t/N(1));
[A2,b2] = generateCSTR(N(2),k,C,t/N(2));
[A3,b3] = generateCSTR(N(3),k,C,t/N(3));
[A4,b4] = generateCSTR(N(4),k,C,t/N(4));
[A5,b5] = generateCSTR(N(5),k,C,t/N(5));
[A6,b6]= generateCSTR(N(6),k,C,t/N(6));
[A7,b7] = generateCSTR(N(7),k,C,t/N(7));

C1=Relaxation(A1,b1);
C2=Relaxation(A2,b2);
C3=Relaxation(A3,b3);
C4=Relaxation(A4,b4);
C5=Relaxation(A5,b5);
C6=Relaxation(A6,b6);
C7=Relaxation(A7,b7);

V= zeros(7)

V(1)=C1(end);
V(2)=C2(end);
V(3)=C3(end);
V(4)=C4(end);
V(5)=C5(end);
V(6)=C6(end);
V(7)=C7(end);

for i = 1:7
    x=N(i);
    y=V(i);
    plot(x,y,'x'); hold on;
end
