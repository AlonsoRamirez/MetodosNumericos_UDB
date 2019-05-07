clc;
clear variables;
syms d; %valor a buscar
disp('Ejercicio 29 Guia 1 MEN')

m = input('Ingrese la masa: '); %95
h= input ('Ingrese la altura: '); %0.43
k1= input('Ingrese la constante k1: '); %40000
k2= input('Ingrese la constante k2: '); %40
fx = input('Ingrese la función f: '); % ((2*k2*(d)^(5/2))/5)+((k1*d^2)/2)-(m*9.8*(h+d))
p0 = input('Ingrese el valor inicial: '); %cualquiera cercano al solve que se hizo de 0.166
e = input('Ingrese el valor de precisión: '); %1e-12

dfx = diff(fx, d);
fx0 = subs(fx, p0);
dfx0 = subs(dfx, p0);
p = p0 - (fx0/dfx0);
cont = 1;
error = abs(p - p0);

disp(' n            d0                d             error')
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

fprintf('\nEl valor aproximado de la distancia(m) es: %9.15f\n', double(p))