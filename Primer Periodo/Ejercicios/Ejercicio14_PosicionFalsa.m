clc
clear variables
syms V
disp('Ejercicio 14 GUIA 1 MEN')
fx=input('Ingrese la función:'); %(365 + 8.2304/(V*(V + 1.4748e-03)*423.55^0.5))*(V - 1.4748e-03) - 0.2968*423.55
p0=input('Ingrese valor inicial p0:'); %0.3444
p1=input('Ingrese valor inicial p1:'); %0.342
e=input('Ingrese la precisión:');
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

    