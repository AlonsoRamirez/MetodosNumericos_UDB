clc;
clear variables;
syms x;
fprintf('Ejercicio 8 GUIA 1 MEN\n')
gx = input('Ingrese la función g [g(x) = x]: '); %((110-(pi*0.896*0.8*5.67e-8*(x^4-298.95^4)))/(pi*0.896*20))+298.95
p0 = input('Ingrese el valor de p0: '); %300.52
e = input('Ingrese el valor de precisión: ');
cont = 1;
p1 = subs(gx, p0);
p2 = subs(gx, p1);
p = p0 - (((p1-p0)^2)/(p2-2*p1+p0));
error = abs(p - p0);
disp('n            p0                p1                 p2              p              error')
fprintf('%2.0f %9.15f %9.15f %9.15f %9.15f %e\n', cont, double(p0), double(p1), double(p2), double(p), double(error))
while error > e
    cont = cont + 1;
    p0 = p;
    p1 = subs(gx, p0);
    p2 = subs(gx, p1);
    p = p0 - (((p1-p0)^2)/(p2-2*p1+p0));
    error = abs(p - p0); 
    fprintf('%2.0f %9.15f %9.15f %9.15f %9.15f %e\n', cont, double(p0), double(p1), double(p2), double(p), double(error))
end
fprintf('\nEl valor aproximado de X es: %9.15f\n', double(p))
