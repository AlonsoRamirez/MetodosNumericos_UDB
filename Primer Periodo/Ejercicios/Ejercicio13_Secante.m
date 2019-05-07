clc;
clear variables;
syms x;
disp('Ejercicio 13 Guia 1 MEN')
Pr=0.7;
Nu=60;
fx = input('Ingrese la función p(x): '); %0.3 + ((1 + (x/282000)^(5/8))^(4/5))*((0.62*x^(1/2)*Pr^(1/3))/(1 + (1 + (0.4/Pr)^(1/4)))) - Nu
p0 = input('Ingrese el valor de p0: '); %58289.48
p1 = input('Ingrese el valor de p1: '); %58289.50
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