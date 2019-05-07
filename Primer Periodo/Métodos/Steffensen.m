clc;
clear variables;
syms x;

fprintf('Steffensen\n')
gx = input('Ingrese la función g [g(x) = x]: ');
p0 = input('Ingrese el valor de p0: ');
%x=input('sdads')
e = input('Ingrese el valor de precisión: ');
cont = 1;

p1 = subs(gx, p0);
p2 = subs(gx, p1);

p = p0 - (((p1-p0)^2)/(p2-2*p1+p0));
%xi=subs(x,p);
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

