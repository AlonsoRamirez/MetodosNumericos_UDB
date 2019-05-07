clc;
clear variables;
syms x;
disp('Ejercicio 17 Guia 1 MEN')
fx = input('Ingrese la función f: '); %(2025+x^2)^(1/2)+(1444+(85-x)^2)^(1/2)-119.5
x0 = input('Ingrese el valor de x0: '); %36.858
x1 = input('Ingrese el valor de x1: '); %36.86
e = input('Ingrese el valor de precisión: ');

fx0 = subs(fx, x0);
fx1 = subs(fx, x1);

if ((fx1 * fx0) < 0) %Cumpliendo la primera condición
    x = x1 - ((fx1*(x1 - x0))/(fx1 - fx0)); %Ecuación de trabajo
    cont = 1;
    error = abs(x - x1);

    disp(' n            x0               x1                x              error')
    fprintf('%2.0f %9.15f %9.15f %9.15f %e\n', cont, double(x0), double(x1), double(x), double(error))

    while error > e
        cont = cont + 1;
        fp = subs(fx, x);

        if (fx1 * fp) < 0
            x0 = x1;
            x1 = x;
        else 
            x1 = x;
        end

        fx0 = subs(fx, x0);
        fx1 = subs(fx, x1);
        x = x1 - ((fx1*(x1 - x0))/(fx1 - fx0));
        error = abs(x - x1);

        fprintf('%2.0f %9.15f %9.15f %9.15f %e\n', cont, double(x0), double(x1), double(x), double(error))
    end

    fprintf('\nEl valor aproximado de X es: %9.15f\n', double(x))
else
    disp('No hay cambio de signo en los valores ingresados')
end


%solve('func') siempre para determinar que valor es el adecuado