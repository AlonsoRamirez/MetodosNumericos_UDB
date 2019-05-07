clc
clear variables
syms x
disp('Ejercicio 23 Guia 1 MEN')
%Graficar el solve por presencia de números imaginarios
%fplot('((1/(4*pi*8.85e-12))*((x*4e-10)/((x^2 + 0.9^2)^(3/2))))-1', [0,2])
%grid on
fx=input('Ingrese la función x=f(x):');%((4*pi*1*8.85e-12)*(x^2 + 0.9^2)^(3/2))/(4e-10)
p0=input('Ingrese el valor inicial:'); %0.2213
e=input('Ingrese la precisión:');
p1=subs(fx,p0);
cont=1;
error=abs(p1-p0);
disp('n          p0              p1                   error')
fprintf('%2.0f %9.15f %9.15f  %e\n',cont,double(p0),double(p1),double(error))
while(error>e)
    cont=cont+1;
    p0=p1;
    p1=subs(fx,p0);
    error=abs(p1-p0);
    fprintf('%2.0f %9.15f %9.15f  %e\n',cont,double(p0),double(p1),double(error))
end
fprintf('El valor aproximado en P es: %9.15f',double(p1))
