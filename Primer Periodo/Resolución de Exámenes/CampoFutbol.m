clc;
clear variables;
syms y;
fprintf('Posición falsa\n')
fy = input('Ingrese la función f: '); %-9600/pi-(pi*y^2)/4+100*y
p0 = input('Ingrese el valor de y0: '); %50.91
p1 = input('Ingrese el valor de y1: '); %50.93
dim = input('Ingresar la ecuación para calcular x: '); %(200-pi*y)/2
e = input('Ingrese el valor de precisión: ');

fp0 = subs(fy, p0);
fp1 = subs(fy, p1);

if ((fp0 * fp1) < 0) %Cumpliendo la primera condición
    p = p1 - ((fp1*(p1 - p0))/(fp1 - fp0)); %Ecuación de trabajo
    cont = 1;
    error = abs(p - p1);
    dsmn = subs(dim,p);
    disp(' n            y0               y1                y              x               error')
    fprintf('%2.0f %9.15f %9.15f %9.15f %9.15f %e\n', cont, double(p0), double(p1), double(p),double(dsmn), double(error))

    while error > e
        cont = cont + 1;
        fp = subs(fy, p);

        if (fp1 * fp) < 0
            p0 = p1;
            p1 = p;
        else 
            p1 = p;
        end

        fp0 = subs(fy, p0);
        fp1 = subs(fy, p1);
        p = p1 - ((fp1*(p1 - p0))/(fp1 - fp0));
        error = abs(p - p1);
       dsmn =subs(dim,p);
       fprintf('%2.0f %9.15f %9.15f %9.15f %9.15f %e\n', cont, double(p0), double(p1), double(p),double(dsmn), double(error))

    end

    fprintf('\nEl valor aproximado de Y es: %9.15f\n', double(p))
    fprintf('\nEl valor aproximado de X es: %9.15f\n', double(dsmn))
    
else
    disp('No hay cambio de signo en los valores ingresados')
end
