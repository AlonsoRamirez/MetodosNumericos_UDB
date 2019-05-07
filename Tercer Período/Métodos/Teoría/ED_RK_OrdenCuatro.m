clc;
clear variables;
syms x y t T;
disp('Métodos de Runge-Kutta: Orden Cuatro')
f = input('\nIntroduzca la función f(t,y): '); %(y^2+3*t*y)/(4*t^2+t*y)
a = input('Introduzca el valor a: '); %1
b = input('Introduzca el valor b: '); %7/5
h = input('Introduzca el valor h: '); %1/10
yI = input('Introduzca el valor de la condición inicial y(a)= '); %1

strED = input('\nED original en comillas: '); %'Dy*(4*t^2+t*y)=(y^2+3*t*y)'
strYI = input('Valor inicial de la forma y(a)=k entre comillas: '); %'y(1)=1'

ts = a:h:b;
n = length(ts);
w = zeros(1,n);
valK = zeros(n,4);

w(1) = yI;
for i=1:n-1
    k1 = h*subs(f,[t,y],[ts(i),w(i)]);
    k2 = h*subs(f,[t,y],[ts(i) + h/2 , w(i) + (1/2)*k1]);
    k3 = h*subs(f,[t,y],[ts(i) + h/2 , w(i) + (1/2)*k2]);
    k4 = h*subs(f,[t,y],[ts(i+1) , w(i) + k3]);
    valK(i+1,:) = [k1 k2 k3 k4];
    
    w(i+1) = w(i) + (1/6)*(k1 + 2*k2 +2*k3 + k4);
    fprintf('\ni= %2.0f \n\n',i-1);
    fprintf('k1= %9.15f \n',double(valK(i+1,1)));
    fprintf('k2= %9.15f \n',double(valK(i+1,2)));
    fprintf('k3= %9.15f \n',double(valK(i+1,3)));
    fprintf('k4= %9.15f \n',double(valK(i+1,4)));
   
end
%solucion exacta
exacta = dsolve(strED, strYI);
Y = subs(exacta, ts);
fprintf('\nED exacta:\n ')
pretty(simplify(exacta))

fprintf('\n N° \t\t\t ti \t\t\t wi + 1 \t\t\t Yi \n')
for i=1:n
    fprintf('%2.0f  %9.15f \t %9.15f \t %9.15f \n',i,double(ts(i)),double(w(i)), double(Y(i)));
end

    