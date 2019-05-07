clc;
clear variables;
syms h;
fprintf('Secante\n')
r=input('Ingrese el radio:');
v=input('Ingrese el volumen:');
l=input('Ingrese la longitud:');
fx = input('Ingrese la función f: '); %(l*(r^2*(pi/2-asin(h/r))-h*(r^2-h^2)^(1/2)))-v
p0 = input('Ingrese el valor de p0: ');%1.78
p1 = input('Ingrese el valor de p1: ');%1.80
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
prof=r-p;
fprintf('\nEl valor aproximado de h es: %9.15f\n', double(p))
fprintf('\nEl valor aproximado de profundidad es: %9.15f\n', double(prof))