clc;
clear variables;
syms x;
disp('Ejercicio 18 Guia 1 MEN')

%con solve se obtiene 27.222021813387944211646709057458

u=input('Ingrese velocidad con que se expele:');
mo=input('Ingrese la masa inicial:');
q=input('Ingrese la tasa de consumo:');
v=input('Ingrese la velocidad:');
fx = input('Ingrese la función f: '); %u*log((mo)/(mo-q*x))-9.8*x-v
t0 = input('Ingrese el valor de t0: '); %27.21
t1 = input('Ingrese el valor de t1: '); %27.23
e = input('Ingrese el valor de precisión: ');


%fzero('(log(17+5*x))/(log(15)) + x^2 -
%38.942244725097574',6.1249999999999999653278473434029)

ft0 = subs(fx, t0);
ft1 = subs(fx, t1);

if ((ft0 * ft1) < 0) %Cumpliendo la primera condición
    t = t1 - ((ft1*(t1 - t0))/(ft1 - ft0)); %Ecuación de trabajo
    cont = 1;
    error = abs(t - t1);

    disp(' n            t0               t1                t              error')
    fprintf('%2.0f %9.15f %9.15f %9.15f %e\n', cont, double(t0), double(t1), double(t), double(error))

    while error > e
        cont = cont + 1;
        fp = subs(fx, t);

        if (ft1 * fp) < 0
            t0 = t1;
            t1 = t;
        else 
            t1 = t;
        end

        ft0 = subs(fx, t0);
        ft1 = subs(fx, t1);
        t = t1 - ((ft1*(t1 - t0))/(ft1 - ft0));
        error = abs(t - t1);

        fprintf('%2.0f %9.15f %9.15f %9.15f %e\n', cont, double(t0), double(t1), double(t), double(error))
    end

    fprintf('\nEl valor aproximado de tiempo es: %9.15f\n', double(t))
else
    disp('No hay cambio de signo en los valores ingresados')
end
