clc;
clear variables;
syms x y t;

disp('Método explicito de Adams-Bashforth de cuatro pasos')
f = input('\nIntroduzca la función f(t,y): '); %5*t^2+2*t-5*y
a = input('Introduzca el valor a: '); %0
b = input('Introduzca el valor b: '); %0.3
h = input('Introduzca el valor h: '); %1/20
yI = input('Introduzca el valor de la condición inicial y(a)= ');

strED = input('\nED original en comillas: '); %'Dy= 5*t^2+2*t-5*y'
strYI = input('Valor inicial de la forma y(a)=k: '); %'y(0)=1/3'

ts = a:h:b;
n = length(ts);
w = zeros(1,n);

exacta = dsolve(strED,strYI);
Y = subs(exacta,ts);
fprintf('\nED exacta:\n ')
pretty(simplify(exacta))

w(1) = yI;
w(2) = subs(exacta,ts(2));
w(3) = subs(exacta,ts(3));
w(4) = subs(exacta,ts(4));

for i=4:1:n-1
    w(i+1) = w(i) + (h/24)*(55*subs(f,[t,y],[ts(i),w(i)]) - 59*subs(f,[t,y],[ts(i-1),w(i-1)]) + 37*subs(f,[t,y],[ts(i-2),w(i-2)]) - 9*subs(f,[t,y],[ts(i-3),w(i-3)]));
end

fprintf('\n N° \t\t ti \t\t\t wi + 1 \t\t\t Yi \n')
for i=1:n
    fprintf('%2.0f  %9.15f \t %9.15f \t %9.15f \n',i,double(ts(i)),double(w(i)),double(Y(i)));
end    