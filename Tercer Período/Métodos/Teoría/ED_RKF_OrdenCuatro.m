clc;
clear variables;
syms x y t;
disp('Métodos de Runge-Kutta-Fehlberg: Orden Cuatro')
f = input('\nIntroduzca la función f(t,y): '); % (exp(t)-y)/t
a = input('Introduzca el valor a: '); %1
b = input('Introduzca el valor b: '); %6/5
h = input('Introduzca el valor h: '); %1/20
yI = input('Introduzca el valor de la condición inicial y(a)= '); %2

strED = input('\nED original en comillas: '); %'Dy= (exp(t)-y)/t'
strYI = input('Valor inicial de la forma y(a)=k entre comillas: ');%'y(1)=2'

ts = a:h:b;
n = length(ts);
w = zeros(1,n);
valK = zeros(n,5);

w(1) = yI;
for i=1:n-1
    k1 = h*subs(f,[t,y],[ts(i),w(i)]);
    k2 = h*subs(f,[t,y],[ts(i) + h/4 , w(i) + (1/4)*k1]);
    k3 = h*subs(f,[t,y],[ts(i) + (3/8)*h , w(i) + (3/32)*k1 + (9/32)*k2]);
    k4 = h*subs(f,[t,y],[ts(i) + (12/13)*h , w(i) + (1932/2197)*k1 - (7200/2197)*k2 + (7296/2197)*k3]);
    k5 = h*subs(f,[t,y],[ts(i) + h , w(i) + (439/216)*k1 - 8*k2 + (3680/513)*k3 - (845/4104)*k4]);
    valK(i+1,:) = [k1 k2 k3 k4 k5];
    
    w(i+1) = w(i) + (25/216)*k1 + (1408/2565)*k3 + (2197/4104)*k4 - (1/5)*k5;
    fprintf('\ni= %2.0f \n\n',i-1);
    fprintf('k1= %9.15f \n',double(valK(i+1,1)));
    fprintf('k2= %9.15f \n',double(valK(i+1,2)));
    fprintf('k3= %9.15f \n',double(valK(i+1,3)));
    fprintf('k4= %9.15f \n',double(valK(i+1,4)));
    fprintf('k5= %9.15f \n',double(valK(i+1,5)));
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