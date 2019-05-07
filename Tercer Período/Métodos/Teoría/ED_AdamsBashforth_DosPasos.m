clc;
clear variables;
syms x y t;
disp('Método explicito de Adams-Bashforth de dos pasos')
f = input('\nIntroduzca la función f(t,y): '); %(1-log(t)+y/t)/(1-log(t))
a = input('Introduzca el valor a: '); %1
b = input('Introduzca el valor b: '); %21/20
h = input('Introduzca el valor h: '); %1/100
yI = input('Introduzca el valor de la condición inicial y(a)= '); %2

strED = input('\nED original en comillas: '); %'Dy=(1-log(t)+y/t)/(1-log(t))'
strYI = input('Valor inicial de la forma y(a)=k: '); %'y(1)=2'

ts = a:h:b;
n = length(ts);
w = zeros(1,n);

exacta = dsolve(strED,strYI);
Y = subs(exacta,ts);
fprintf('\nED exacta:\n ')
pretty(simplify(exacta))

w(1) = yI;
w(2) = subs(exacta,ts(2));


for i=2:1:n-1
    w(i+1) = w(i) + (h/2)*(3*subs(f,[t,y],[ts(i),w(i)]) - subs(f,[t,y],[ts(i-1),w(i-1)]));
end

fprintf('\n N° \t\t ti \t\t\t wi + 1 \t\t\t Yi \n')
for i=1:n
    fprintf('%2.0f  %9.15f \t %9.15f \t %9.15f \n',i,double(ts(i)),double(w(i)),double(Y(i)));
end

    