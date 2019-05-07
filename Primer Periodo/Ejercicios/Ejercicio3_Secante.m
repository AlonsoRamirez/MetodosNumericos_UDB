
clc;
clear variables;
syms x;
disp('Ejercicio 3 Guia 1 MEN')
fx = input('Ingrese la función p(x): '); %((x+(x)^(1/5))*(3.346-x+(3.346-x)^(1/5)))-7.533340127832330
p0 = input('Ingrese el valor de p0: '); %2.044
p1 = input('Ingrese el valor de p1: '); %2.046
e = input('Ingrese el valor de precisión: '); %1e-12
fp0 = subs(fx, p0);
fp1 = subs(fx, p1);
p2 = p1 - ((fp1*(p1 - p0))/(fp1 - fp0));
cont = 1;
error = abs(p2 - p1);
disp(' n            p0               p1                p              error')
fprintf('%2.0f %9.15f %9.15f %9.15f %e\n', cont, double(p0), double(p1), double(p2), double(error))
while error > e
    cont = cont + 1;
    p0 = p1;
    p1 = p2;
    fp0 = subs(fx, p0);
    fp1 = subs(fx, p1);
    p2= p1 - ((fp1*(p1 - p0))/(fp1 - fp0));
    error = abs(p2 - p1);
    fprintf('%2.0f %9.15f %9.15f %9.15f %e\n', cont, double(p0), double(p1), double(p2), double(error))
end
fprintf('\nEl valor aproximado de X es: %9.15f\n', double(p2))