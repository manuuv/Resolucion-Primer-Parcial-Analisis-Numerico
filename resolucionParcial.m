function resolucionParcial
%Alumno : Vazquez Manuel 50192
g = load("p1_3k9_01.txt");
dt = 1/5000;
t0 = 0;
dim = length(g);
tf = (length(g)-1)*dt;
t1 = 3.5;
w = 1/2;
Igg = 0;
I22 = 0;
matriz1 = [0 , 1; -13255, -1.84];
matriz2 = [0;1];
x(1,1) = 0;
x(2,1) = 0;
t(1) = 0;


for m = 1:dim-1 %RK
  k1 = dt * (matriz1 * x(:,m) + matriz2 * g(m));
  xg = x(:,m) + k1/(2*w);
  tg = t(m) + dt/(2*w);
  k2 = dt * (matriz1 * xg + matriz2 * g(m));
  x(:,m+1) = x(:,m) + (1-w)*k1 + w*k2;
  t(m+1) = t(m) + dt;
endfor

for m = 1 : dim-1 %Igg
  f1 = g(m)^2;
  f2 = g(m+1)^2;
  Igg = Igg + dt * ((f1+f2)/2);
endfor

dx1(1) = (-3*x(1,1)+4*x(1,2)-x(1,3))/(2*dt);

for m=2:dim-1
  dx1(m) = (-1*x(1,m-1) + x(1,m+1))/(2*dt);
endfor

dx1(dim) = (3*x(1,dim)-4*x(1,dim-1)+x(1,dim-2))/(2*dt);

for m = 1 : dim-1 %Igg
  f1 = dx1(m)^2;
  f2 = dx1(m+1)^2;
  I22 = I22 + dt * ((f1+f2)/2);
endfor


figure (1)
plot(t,x(1,:),"r");
disp("Componente t1=3.5seg")
disp(t(17501))
disp("x1 en t1:")
disp(x(1,17501))
disp("x2 en t1:")
disp(x(2,17501))
disp("Valor de Igg:")
disp(Igg)
disp("Valor de I22:")
disp(I22)





endfunction

resolucionParcial;
