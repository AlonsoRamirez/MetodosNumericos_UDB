clc;
syms x y t;
disp('ECUACIONES DIFRENCIALES CON VALORES INICIALES')
disp('Métodos multipasos implicitos')
disp('Método explicito de Adams-Moulton de cuatro pasos')
disp('Recordar que ya debemos tener los valores w+1 calculados por cualquier otro método explicito')
f = input('\nIntroduzca la función f(t,y): ');
a = input('Introduzca el valor a: ');
b = input('Introduzca el valor b: ');
h = input('Introduzca el valor h: ');
yI = input('Introduzca el valor de la condición inicial y(a)= ');
vw = input('Introduzca el vector de valores wi+1 calculado anteriormente: ');

strED = input('\nED original en comillas: ');
strYI = input('Valor inicial de la forma y(a)=k: ');

ts = a:h:b;
n = length(ts);
w = zeros(1,n);

exacta = dsolve(strED,strYI);
Y = subs(exacta,ts);

w(1) = yI;
w(2) = subs(exacta,ts(2));
w(3) = subs(exacta,ts(3));
w(4) = subs(exacta,ts(4));

for i=4:1:n-1
    w(i+1) = w(i) + (h/720)*(251*subs(f,[t,y],[ts(i+1),vw(i+1)]) + 646*subs(f,[t,y],[ts(i),w(i)]) - 264*subs(f,[t,y],[ts(i-1),w(i-1)]) + 106*subs(f,[t,y],[ts(i-2),w(i-2)]) - 19*subs(f,[t,y],[ts(i-3),w(i-3)]));
end

fprintf('\n N° \t\t ti \t\t\t wi + 1 \t\t\t Yi \n')
for i=1:n
    fprintf('%2.0f  %9.15f \t %9.15f \t %9.15f \n',i,double(ts(i)),double(w(i)),double(Y(i)));
end

    