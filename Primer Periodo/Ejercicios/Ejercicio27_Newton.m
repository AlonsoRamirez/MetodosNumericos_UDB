clc;
clear variables;
syms x;
disp('Ejercicio 11 Guia 1 MEN')
V=input('Ingresar velocidad:');
m=input('Ingresar masa:');
t=input('Ingresar tiempo:');
g=input('Ingresar gravedad:');
fx = input('Ingrese la función f: '); %-V+(((g/x)*m)*(1-exp(-(x*t)/m)))
c0 = input('Ingrese el valor inicial: '); %3.48
e = input('Ingrese el valor de precisión: ');
 
dfx = diff(fx, x);
fx0 = subs(fx, c0);
dfx0 = subs(dfx, c0);
p = c0 - (fx0/dfx0);
cont = 1;
error = abs(p - c0);

disp(' n            c0                c              error')
fprintf('%2.0f %9.15f %9.15f %e\n', cont, double(c0), double(p), double(error))

while error > e
    cont = cont + 1;
    c0 = p;
    fx0 = subs(fx, c0);
    dfx0 = subs(dfx, c0);
    p = c0 - (fx0/dfx0);
    error = abs(p - c0);
    fprintf('%2.0f %9.15f %9.15f %e\n', cont, double(c0), double(p), double(error))
end

fprintf('\nEl valor aproximado de C es: %9.15f\n', double(p))