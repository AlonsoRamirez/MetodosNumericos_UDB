
clear variables;
syms x;
disp('Método de Newton Raphson')
fx = input('Ingrese la función f: '); %107.25-423.5/x -x^2
p0 = input('Ingrese el valor inicial: '); %5.49
z= input('Ingresa la ecuación para hallar la otra dimensión: '); %105.875/x^2
e = input('Ingrese el valor de precisión: ');

dfx = diff(fx, x);
fx0 = subs(fx, p0);
dfx0 = subs(dfx, p0);
p = p0 - (fx0/dfx0);
cont = 1;
error = abs(p - p0);
zz=subs(z,p);
disp(' n            p0                x                z             error')
fprintf('%2.0f %9.15f %9.15f %9.15f %e\n', cont, double(p0), double(p),double(zz), double(error))

while error > e
    cont = cont + 1;
    p0 = p;
    fx0 = subs(fx, p0);
    dfx0 = subs(dfx, p0);
    p = p0 - (fx0/dfx0);
    error = abs(p - p0);
    zz=subs(z,p);
    fprintf('%2.0f %9.15f %9.15f %9.15f %e\n', cont, double(p0), double(p), double(zz), double(error))
end

fprintf('\nEl valor aproximado de X es: %9.15f\n', double(p))
fprintf('\nEl valor aproximado de Z es: %9.15f\n', double(zz))