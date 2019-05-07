clc;
clear variables;
syms x;
disp('Ejercicio 1 Guia 1 MEN')

%con solve se obtiene 6.1249999999999999962550953509714

fx = input('Ingrese la función f: '); %(log(17+5*x))/(log(15)) + x^2 - 38.942244725097574
p0 = input('Ingrese el valor de p0: '); %6.1225
p1 = input('Ingrese el valor de p1: '); %6.1255
e = input('Ingrese el valor de precisión: ');


%fzero('(log(17+5*x))/(log(15)) + x^2 -
%38.942244725097574',6.1249999999999999653278473434029)

fp0 = subs(fx, p0);
fp1 = subs(fx, p1);

if ((fp0 * fp1) < 0) %Cumpliendo la primera condición
    p = p1 - ((fp1*(p1 - p0))/(fp1 - fp0)); %Ecuación de trabajo
    cont = 1;
    error = abs(p - p1);

    disp(' n            p0               p1                p              error')
    fprintf('%2.0f %9.15f %9.15f %9.15f %e\n', cont, double(p0), double(p1), double(p), double(error))

    while error > e
        cont = cont + 1;
        fp = subs(fx, p);

        if (fp1 * fp) < 0
            p0 = p1;
            p1 = p;
        else 
            p1 = p;
        end

        fp0 = subs(fx, p0);
        fp1 = subs(fx, p1);
        p = p1 - ((fp1*(p1 - p0))/(fp1 - fp0));
        error = abs(p - p1);
        fprintf('%2.0f %9.15f %9.15f %9.15f %e\n', cont, double(p0), double(p1), double(p), double(error))
    end

    fprintf('\nEl valor aproximado de X es: %9.15f\n', double(p))
else
    disp('No hay cambio de signo en los valores ingresados')
end
