function plot = generatePlot(N,k,C,t)



A1,b1 = generateCSTR(N(1),k,C,t/N(1));
A2,b2 = generateCSTR(N(2),k,C,t/N(2));
A3,b3 = generateCSTR(N(3),k,C,t/N(3));
A4,b4 = generateCSTR(N(4),k,C,t/N(4));
A5,b5 = generateCSTR(N(5),k,C,t/N(5));
A6,b6 = generateCSTR(N(6),k,C,t/N(6));
A7,b7 = generateCSTR(N(7),k,C,t/N(7));

C1=GuassElimination(A1,b1);
C2=GuassElimination(A2,b2);
C3=GuassElimination(A3,b3);
C4=GuassElimination(A4,b4);
C5=GuassElimination(A5,b5);
C6=GuassElimination(A6,b6);
C7=GuassElimination(A7,b7);

V= zeros(7)

V(1)=varr(C1);
V(2)=varr(C2);
V(3)=varr(C3);
V(4)=varr(C4);
V(5)=varr(C5);
V(6)=varr(C6);
V(7)=varr(C7);

for i = i:N
    plot(N(i),V(i));hold on;
end
