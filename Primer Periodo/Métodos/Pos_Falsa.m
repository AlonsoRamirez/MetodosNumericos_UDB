clc;
clear variables;
syms x;
fprintf('Posición falsa\n')
fx = input('Ingrese la función f: ');
p0 = input('Ingrese el valor de p0: ');
p1 = input('Ingrese el valor de p1: ');
e = input('Ingrese el valor de precisión: ');

fp0 = subs(fx, p0);
fp1 = subs(fx, p1);

if ((fp0 * fp1) < 0) %Cumpliendo la primera condición
    p2 = p1 - ((fp1*(p1 - p0))/(fp1 - fp0)); %Ecuación de trabajo
    cont = 1;
    error = abs(p2 - p1);

    disp(' n            p0               p1                p              error')
    fprintf('%2.0f %9.15f %9.15f %9.15f %e\n', cont, double(p0), double(p1), double(p2), double(error))

    while error > e
        cont = cont + 1;
        fp = subs(fx, p2);

        if (fp1 * fp) < 0
            p0 = p1;
            p1 = p2;
        else 
            p0= p0;
            p1 = p2;
        end

        fp0 = subs(fx, p0);
        fp1 = subs(fx, p1);
        p2 = p1 - ((fp1*(p1 - p0))/(fp1 - fp0));
        error = abs(p2 - p1);

        fprintf('%2.0f %9.15f %9.15f %9.15f %e\n', cont, double(p0), double(p1), double(p2), double(error))
    end

    fprintf('\nEl valor aproximado de X es: %9.15f\n', double(p2))
else
    disp('No hay cambio de signo en los valores ingresados')
end
