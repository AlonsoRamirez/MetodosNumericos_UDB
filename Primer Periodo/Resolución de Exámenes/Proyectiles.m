clc;
clear variables;
syms x;
fprintf('Secante\n')
%x=vo*t*cos(theta)
%y=yo+vo*t*sin(theta)-(1/2)*g*t^2
fx = input('Ingrese la función f: '); %0.8 + 40*tan(x) - 19.62/(cos(x))^2
p0 = input('Ingrese el valor de B0: '); %0.6349
p1 = input('Ingrese el valor de B1: '); %0.635
e = input('Ingrese el valor de precisión: ');

fp0 = subs(fx, p0);
fp1 = subs(fx, p1);
p = p1 - ((fp1*(p1 - p0))/(fp1 - fp0));
cont = 1;
error = abs(p - p1);

disp(' n            p0               p1                p              error')
fprintf('%2.0f %9.15f %9.15f %9.15f %e\n', cont, double(p0), double(p1), double(p), double(error))

while error > e
    cont = cont + 1;
    p0 = p1;
    p1 = p;
    
    fp0 = subs(fx, p0);
    fp1 = subs(fx, p1);
    p = p1 - ((fp1*(p1 - p0))/(fp1 - fp0));
    error = abs(p - p1);

    fprintf('%2.0f %9.15f %9.15f %9.15f %e\n', cont, double(p0), double(p1), double(p), double(error))
end

fprintf('\nEl valor aproximado del ángulo en radianes es: %9.15f\n', double(p))