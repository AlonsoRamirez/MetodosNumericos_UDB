clc
clear variables
syms x %determinar resistor apropiado para disipar energía
disp ('Ejercicio 25 Guia 1 MEN')
%declarar variables

fx=input('Ingrese la función a evaluar:'); %exp((-0.05*x)/(10))*cos(sqrt((1/(5e-4))-((0.05*x^2)/100)))-0.01
p0 = input('Ingrese el valor de p0: '); %605.88
p1 = input('Ingrese el valor de p1: '); %605.89
e = input('Ingrese el valor de precisión: '); %1e-12
fp0=subs(fx,p0);
fp1=subs(fx,p1);
if((fp0*fp1)<0)
    p2=p1-((fp1*(p1-p0))/(fp1-fp0));
    cont=1;
    error=abs(p2-p1);
    disp('n           p0                p1                   p2             error ')
    fprintf('%2.0f  %9.15f  %9.15f  %9.15f   %e\n',cont,double(p0),double(p1),double(p2),double(error))  
    while(error>e)
        cont=cont+1;
        fp2=subs(fx,p2);
    if((fp1*fp2)<0)
        p0=p1;
        p1=p2;
    else
        p1=p2;
    end
    fp0=subs(fx,p0);
    fp1=subs(fx,p1);
    p2=p1-((fp1*(p1-p0))/(fp1-fp0));
    error=abs(p2-p1);
    fprintf('%2.0f  %9.15f  %9.15f  %9.15f   %e\n',cont,double(p0),double(p1),double(p2),double(error))  
    end
    fprintf('\nEl valor aproximado de X es: %9.15f\n', double(p2))
else
    disp('No hay cambios de signo entre los valores iniciales')
end

    