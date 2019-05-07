clc;
clear variables;
syms x;
fprintf('Secante\n')
fx = input('Ingrese la función f: '); %-954*pi+(4/3)*(pi*x^3)+(x/2)*(366*pi-4*pi*x^2)
p0 = input('Ingrese el valor de r0: '); %5.9
p1 = input('Ingrese el valor de r1: '); %6.1
altura=input('Ingresar la ecuación para calcular h:'); %(366*pi-4*pi*x^2)/(2*pi*x)
e = input('Ingrese el valor de precisión: ');

fp0 = subs(fx, p0);
fp1 = subs(fx, p1);
p = p1 - ((fp1*(p1 - p0))/(fp1 - fp0));
cont = 1;
error = abs(p - p1);
alt=subs(altura,p);
disp(' n            r0               r1                r                 h              error')
fprintf('%2.0f %9.15f %9.15f %9.15f %9.15f %e\n', cont, double(p0), double(p1), double(p),double(alt), double(error))

while error > e
    cont = cont + 1;
    p0 = p1;
    p1 = p;
    
    fp0 = subs(fx, p0);
    fp1 = subs(fx, p1);
    p = p1 - ((fp1*(p1 - p0))/(fp1 - fp0));
    error = abs(p - p1);
    alt=subs(altura,p);
    fprintf('%2.0f %9.15f %9.15f %9.15f %9.15f %e\n', cont, double(p0), double(p1), double(p),double(alt), double(error))

end

fprintf('\nEl valor aproximado de r es: %9.15f\n', double(p))
fprintf('\nEl valor aproximado de h es: %9.15f\n', double(alt))