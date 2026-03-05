function dCadt = PFR(t,Ca)

global v k C0 N dz

dCadt=zeros(N,1);

% first term
dCadt(1)=(-1*v*(Ca(2)-C0)/(2*dz))-k*Ca(1);

for i=2:N-1
%   intermediate terms
    dCadt(i)=-1*v*(Ca(i+1)-Ca(i-1))/(2*dz)-k*Ca(i);
end
% last term
dCadt(N)=(((-1*v)/dz)-k)*Ca(N)+(v/dz)*Ca(N-1);