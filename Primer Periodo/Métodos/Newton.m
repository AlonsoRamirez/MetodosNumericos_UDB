clc;
clear variables;
syms x;
disp('Método de Newton Raphson')
fx = input('Ingrese la función f: '); %(9.8*x/13.9)*(1-exp(-7*13.9/x))-35 
p0 = input('Ingrese el valor inicial: '); %cualquiera cercano al solve que se hizo
e = input('Ingrese el valor de precisión: ');
dfx = diff(fx, x);
fx0 = subs(fx, p0);
dfx0 = subs(dfx, p0);
p = p0 - (fx0/dfx0);
cont = 1;
error = abs(p - p0);
disp(' n            p0              x              error')
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