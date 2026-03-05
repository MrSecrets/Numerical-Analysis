clc

global v k C0 N L dz

dz = 0.1;
v = 0.2;
k = 0.1;
L = 10;
C0 = 1000;
N = L/dz;
[A,b] = Matrix(N,v,k,C0);
tf=100;

%steady state solution
% xs = A\-b;
% Cass = [C0;xs];
z = zeros(N+1,1);
for i = 1:N
    z(i+1) = i*dz;
end
% figure(4)
% plot(z,Cass,'r'); hold on;

%dynamic solution
% % initail condition
Ca = C0*ones(N,1);

% solution 1

Ca1 = Ca;
dt=0.05;
[t,x] = euler_explicit(@PFR,Ca1,tf,dt);
Ca1 = zeros(length(t),N+1);
Ca1(:,1)=C0;
for i = 1:N
    Ca1(:,i+1)=x(:,i);
end
figure(1)
plot(z,Ca1(end,:),'b'); hold on;

% solution 2
Ca2 = Ca;
dt=0.2;
[t,x] = euler_explicit(@PFR,Ca2,tf,dt);
Ca2 = zeros(length(t),N+1);
Ca2(:,1) = C0;
for i=1:N
    Ca2(:,i+1) = x(:,i);
end
figure(2)
plot(z,Ca2(end,:),'c'); hold on;

% solution 3
Ca3 = Ca;
dt=0.2;
[t,x] = Euler_implicit(@PFR,Ca3,tf,dt);
Ca3 = zeros(length(t),N+1);
Ca3(:,1)=C0;
for i=1:N
    Ca3(:,i+1)=x(:,i);
end
figure(3)
plot(z,Ca3(end,:),'r'); hold on;


