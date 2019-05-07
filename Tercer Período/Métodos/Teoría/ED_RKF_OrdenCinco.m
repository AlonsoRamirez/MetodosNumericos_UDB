clc
clear variables;
syms x y t;
disp('Métodos de Runge-Kutta-Fehlberg: Orden Cinco')
f = input('\nIntroduzca la función f(t,y): '); %(exp(-t)*sin(2*t)-y*(t+1))/t
a = input('Introduzca el valor a: '); %1
b = input('Introduzca el valor b: '); %201/200
h = input('Introduzca el valor h: ');% 1/800
yI = input('Introduzca el valor de la condición inicial y(a)= '); %0

strED = input('\nED original en comillas: '); %'Dy=(exp(-t)*sin(2*t)-y*(t+1))/t'
strYI = input('Valor inicial de la forma y(a)=k entre comillas: ');%'y(1)=0'

ts = a:h:b;
n = length(ts);
w = zeros(1,n);
valK = zeros(n,6);

w(1) = yI;
for i=1:n-1
    k1 = h*subs(f,[t,y],[ts(i),w(i)]);
    k2 = h*subs(f,[t,y],[ts(i) + h/4 , w(i) + (1/4)*k1]);
    k3 = h*subs(f,[t,y],[ts(i) + (3/8)*h , w(i) + (3/32)*k1 + (9/32)*k2]);
    k4 = h*subs(f,[t,y],[ts(i) + (12/13)*h , w(i) + (1932/2197)*k1 - (7200/2197)*k2 + (7296/2197)*k3]);
    k5 = h*subs(f,[t,y],[ts(i) + h , w(i) + (439/216)*k1 - 8*k2 + (3680/513)*k3 - (845/4104)*k4]);
    k6 = h*subs(f,[t,y],[ts(i) + h/2 , w(i) - (8/27)*k1 + 2*k2 - (3544/2565)*k3 + (1859/4104)*k4-(11/40)*k5]);
    
    valK(i+1,:) = [k1 k2 k3 k4 k5 k6];
    
    w(i+1) = w(i) + (16/135)*k1 + (6656/12825)*k3 + (28561/56430)*k4 - (9/50)*k5 + (2/55)*k6;
    fprintf('\nj= %2.0f \n\n',i-1);
    fprintf('k1= %9.15f \n',double(valK(i+1,1)));
    fprintf('k2= %9.15f \n',double(valK(i+1,2)));
    fprintf('k3= %9.15f \n',double(valK(i+1,3)));
    fprintf('k4= %9.15f \n',double(valK(i+1,4)));
    fprintf('k5= %9.15f \n',double(valK(i+1,5)));
    fprintf('k6= %9.15f \n',double(valK(i+1,6)));
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