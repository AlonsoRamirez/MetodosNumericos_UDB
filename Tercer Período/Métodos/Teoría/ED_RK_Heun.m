clc;
clear variables;
syms x y t;
disp('Métodos de Runge-Kutta: Método de Heun')
f = input('\nIntroduzca la función f(t,y): '); %-(2*t*tan(y)+5)/(t^2*sec(y)^2)
a = input('Introduzca el valor a: ');
b = input('Introduzca el valor b: ');
h = input('Introduzca el valor h: ');
yI = input('Introduzca el valor de la condición inicial y(a)= '); %pi/4

strED = input('\nED original en comillas: ');%'Dy*(t^2*sec(y)^2)=-(2*t*tan(y)+5)'
strYI = input('Valor inicial de la forma y(a)=k entre comillas: '); %'y(1/2)=pi/4'

ts = a:h:b;
n = length(ts);
w = zeros(1,n);

w(1) = yI;
for i=1:n-1
    subs1 = ts(i) + (2*h)/3;
    subs2 = w(i) + ((2*h)/3)*subs(f,[t,y],[ts(i),w(i)]);
    w(i+1) = w(i) + (h/4)*subs(f,[t,y],[ts(i),w(i)]) + (3*h/4)*subs(f,[t,y],[subs1,subs2]);
end

%solucion exacta
exacta = dsolve(strED, strYI);
Y = subs(exacta, ts);
fprintf('\nED exacta:\n ')
pretty(simplify(exacta))

fprintf('\n N° \t\t\t ti \t\t\t wi + 1 \t\t\t Yi \n')
for i=1:n
   
    fprintf('%2.0f  %9.15f \t %9.15f \t %9.15f \n',i,double(ts(i)),double(w(i)),double(Y(i)));
end

    E=[ts;w]; %matriz bidimensional para Neville
%X=E(:,1);Y=E(:,2);X0=valor;
%[Q]=Neville_ED(X,Y,X0);