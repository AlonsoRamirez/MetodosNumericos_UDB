clc;
clear variables;
syms x;
disp('Ejercicio 3 Guia 1 MEN')
f = input('Ingrese la función f: '); %((x+(x)^(1/5))*(3.346-x+(3.346-x)^(1/5)))-7.533340127832330
%Agarrar el segundo valor de solve antes de imaginarios
a = input('Ingrese el valor de a: '); %2.043
b = input('Ingrese el valor de b: '); %2.045
e = input('Ingrese el valor de precisión: '); %1e-12
cont = 1;
fa = subs(f, a);
fb = subs(f, b);
if (fa * fb) < 0
    p = (a+b)/2;
    error = abs(subs(f, p));
    disp(' n            a                b                p              error')
    fprintf('%2.0f %9.15f %9.15f %9.15f %e\n', double(cont), double(a), double(b), double(p), double(error))
    while error > e 
        cont = cont + 1;
        fa = subs(f, a);
        fp = subs(f, p);
        if (fa * fp) < 0
            b = p;
        else
            a = p;
        end
        po = p;
        p = (a+b)/2;
        error = abs(p - po);
        fprintf('%2.0f %9.15f %9.15f %9.15f %e\n', cont, double(a), double(b), double(p), double(error))  
    end
    fprintf('\nEl valor de P es: %9.15f \n', double(p))  
else 
    disp('No hay cambio de signo en los valores ingresados')
end

