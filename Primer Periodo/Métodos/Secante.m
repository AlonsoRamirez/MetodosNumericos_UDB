clc;
clear variables;
syms x;
fprintf('Secante\n')
fx = input('Ingrese la función f: ');
p0 = input('Ingrese el valor de p0: ');
p1 = input('Ingrese el valor de p1: ');
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

fprintf('\nEl valor aproximado de X es: %9.15f\n', double(p))