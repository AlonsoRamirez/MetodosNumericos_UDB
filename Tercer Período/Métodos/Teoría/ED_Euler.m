clc;
clear variables;
syms y t;
disp('Método de Euler')
f = input('\nIntroduzca la función f(t,y): '); %(log(t)-y)/(t+1)
a = input('Introduzca el valor a: '); %1
b = input('Introduzca el valor b: '); %61/60
h = input('Introduzca el valor h: '); %1/300
yI = input('Introduzca el valor de la condición inicial y(a)= '); %10

strED = input('\nED original en comillas: '); %'Dy=(log(t)-y)/(t+1))'
strYI = input('Valor inicial de la forma y(a)=k entre comillas: '); %'y(1)=10'

ts = a:h:b;
n = length(ts);
w = zeros(1,n);

w(1) = yI;
for i=1:n-1
    w(i+1) = w(i)+(h*subs(f,[t,y],[ts(i),w(i)]));   
end

%solucion exacta
exacta = dsolve(strED, strYI);
Y = subs(exacta, ts);
fprintf('\nED exacta:\n ')
pretty(simplify(exacta))

fprintf('\n N° \t\t\t ti \t\t\t wi + 1 \t\t\t Yi\n')
for i=1:n
    %fprintf('%2.0f  %9.15f \t %9.15f \t %9.15f \n',i,double(ts(i)),double(w(i)));
    fprintf('%2.0f  %9.15f \t %9.15f \t %9.15f \n',i,double(ts(i)),double(w(i)),double(Y(i)));
end
E=[ts;w]; %matriz bidimensional para Neville
%X=E(:,1);Y=E(:,2);X0=valor;
%[Q]=Neville_ED(X,Y,X0);
    