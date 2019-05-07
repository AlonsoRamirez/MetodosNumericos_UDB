clc;
clear variables;
syms t;
disp('Ejercicio 28 Guia 1 MEN')
f = input('Ingrese la función C(t): '); %75*exp(-(3*t/2))+20*exp(-(3*t/40))-15
%fplot('75*exp(-(3*t/2))+20*exp(-(3*t/40))-15',[3.9,4.1])
%grid on
%elegir como valor de solve el que coincida con el 0
a = input('Ingrese el valor de t0: '); %4.0015
b = input('Ingrese el valor de t1: '); %4.0017
e = input('Ingrese el valor de precisión: '); %1e-12
cont = 1;
fa = subs(f, a);
fb = subs(f, b);
if (fa * fb) < 0
    p = (a+b)/2;
    error = abs(subs(f, p));
    disp(' n            t0               t1                p              error')
    fprintf('%2.0f %9.15f %9.15f %9.15f %e\n', double(cont), double(a), double(b), double(p), double(error))
    while error > e 
        cont = cont + 1;
        fa = subs(f, a);
        fn = subs(f, p);
        if (fa * fn) < 0
            b = p;
        else
            a = p;
        end 
        po = p;
        p = (a+b)/2;
        error = abs(p - po);
        fprintf('%2.0f %9.15f %9.15f %9.15f %e\n', cont, double(a), double(b), double(p), double(error)) 
    end
    fprintf('\nEl valor de concentración de bacterias es: %9.15f \n', double(p))
else 
    disp('No hay cambio de signo en los valores ingresados')
end