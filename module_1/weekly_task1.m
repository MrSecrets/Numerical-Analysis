clc

% Write a MatLab code to plot sin t sin 2t and e sin t

t = [0:0.1:4*pi];

g1=sin(t.*1)
g2=sin(t.*2)
g3=exp(t.*(-0.25))


plot(t,g1);hold on;
plot(t,g2,'r');hold on;
plot(t,g3.*g2,'c');