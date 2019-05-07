clc;
clear variables;
syms y t;

disp('Método de Taylor de orden superior')
f = input('\nIntroduzca la función f(t,y): '); %exp(y)*cos(t)
a = input('Introduzca el valor a: '); %0
b = input('Introduzca el valor b: '); %0.08
h = input('Introduzca el valor h: '); %1/50
yI = input('Introduzca el valor de la condición inicial y(a)= ');%0
orden = input('Introduzca el orden a trabajar: ');%4 pero puede ser 5,6,7...
fprintf('\n')

deri(1) = f;
for i=2:1:orden
    %Derivadas con respecto a t e implicitas en y
    deri(i) = input(['Introduzca la ' num2str(i - 1) ' derivada: ']);
end
%exp(2*y)*cos(t)^2 - exp(y)*sin(t)
%- exp(y)*cos(t) - 2*exp(2*y)*cos(t)*sin(t) - exp(y)*cos(t)*(exp(y)*sin(t) - 2*exp(2*y)*cos(t)^2)
%exp(y)*sin(t) - 2*exp(2*y)*cos(t)^2 + 2*exp(2*y)*sin(t)^2 + exp(y)*sin(t)*(exp(y)*sin(t) - 2*exp(2*y)*cos(t)^2) - exp(y)*cos(t)*(exp(y)*cos(t) + 4*exp(2*y)*cos(t)*sin(t) + exp(y)*cos(t)*(exp(y)*sin(t) - 2*exp(2*y)*cos(t)^2) + exp(y)*cos(t)*(exp(y)*sin(t) - 4*exp(2*y)*cos(t)^2)) - exp(y)*cos(t)*(exp(y)*cos(t) + 4*exp(2*y)*cos(t)*sin(t))
strED = input('\nED original en comillas: ');%'Dy=exp(y)*cos(t)'
strYI = input('Valor inicial de la forma y(a)=k en comillas: ');%'y(0)=0'

ts = a:h:b;
n = length(ts);
w = zeros(1,n);

w(1) = yI;
for i=1:n-1
    w(i+1) = w(i);
    for j=1:orden
        w(i+1) = w(i+1) + ((h^j)/factorial(j))*subs(deri(j),[t,y],[ts(i),w(i)]);
    end
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

    