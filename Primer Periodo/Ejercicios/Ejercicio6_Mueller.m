clc;
clear variables;
syms x;
disp('Ejercicio 6 Guia 1 MEN');
f = input('Ingrese la funci�n f: '); %3*x^5+11*x^4-21*x^3-10*x^2+21*x-5
x0 = input('Ingrese el valor de x0: '); %-6.1
x1 = input('Ingrese el valor de x1: '); %-5.3
x2 = input('Ingrese el valor de x2: '); %-4.9
error = input('Ingrese el valor de precisi�n: '); %1e-12
f0=subs(f,x0);
f1=subs(f,x1);
c=subs(f,x2)
a= double(((x1-x2)*(f0-c)-(x0-x2)*(f1-c)) / ((x0-x2)*(x1-x2)*(x0-x1)));
b= double(((x0-x2)^2*(f1-c)-(x1-x2)^2*(f0-c)) / ((x0-x2)*(x1-x2)*(x0-x1)));
x3=double(x2-((2*c)/(b+sign(b)*sqrt(b^2-4*a*c))));
n=1;
paro=abs(x3-x2);
fprintf('TABLA DE ITERACIONES\n n=%2.0f Xo=%9.15f X1=%9.15f X2=%9.15f a=%9.15f b=%9.15f c=%9.15f X3=%9.15f error=%e\n',double(n),double(x0),double(x1),double(x2),double(a),double(b),double(c),double(x3),double(paro));
while paro>error
    n=n+1;
    x0=x1;
    x1=x2;
    x2=x3;
    f0=subs(f,x0);
    f1=subs(f,x1);
    c=subs(f,x2);
    a= double(((x1-x2)*(f0-c)-(x0-x2)*(f1-c)) / ((x0-x2)*(x1-x2)*(x0-x1)));
    b= double(((x0-x2)^2*(f1-c)-(x1-x2)^2*(f0-c)) / ((x0-x2)*(x1-x2)*(x0-x1)));
    x3=double(x2-((2*c)/(b+sign(b)*sqrt(b^2-4*a*c))));
    paro=abs(x3-x2);
    fprintf(' n=%2.0f Xo=%9.15f X1=%9.15f X2=%9.15f a=%9.15f b=%9.15f c=%9.15f X3=%9.15f error=%e\n',double(n),double(x0),double(x1),double(x2),double(a),double(b),double(c),double(x3),double(paro));
end
fprintf('\n\t\tEl valor aproximado de x es: %9.12f\n',double(x3))