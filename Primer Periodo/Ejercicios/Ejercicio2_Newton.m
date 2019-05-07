clc;
clear variables;
syms x;
disp('Ejercicio 2 Guia 1 MEN')
%fzero('atan(2.05)+1.05-x',2.1669523252733864776147900015796)
fx = input('Ingrese la función f: '); %atan(2.05)+1.05-x
p0 = input('Ingrese el valor inicial: '); %2.16
e = input('Ingrese el valor de precisión: ');
dfx = diff(fx, x);
fx0 = subs(fx, p0);
dfx0 = subs(dfx, p0);
p = p0 - (fx0/dfx0);
cont = 1;
error = abs(p - p0);
disp(' n            p0                x              error')
fprintf('%2.0f %9.15f %9.15f %e\n', cont, double(p0), double(p), double(error))
while error > e
    cont = cont + 1;
    p0 = p;
    fx0 = subs(fx, p0);
    dfx0 = subs(dfx, p0);
    p = p0 - (fx0/dfx0);
    error = abs(p - p0);
    fprintf('%2.0f %9.15f %9.15f %e\n', cont, double(p0), double(p), double(error))
end

fprintf('\nEl valor aproximado de X es: %9.15f\n', double(p))