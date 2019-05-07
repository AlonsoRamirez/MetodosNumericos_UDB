clc
clear variables
syms x
disp('Ejercicio 24 Guia 1 MEN')

fx=input('Ingrese la función x=g(x):'); % (2/((1.7e-19)*(6.5e6)*((1350*(1000/300)^(-2.42)))))-x-sqrt(x^2+4*(6.21e9)^2)
p0=input('Ingrese el punto inicial:');
e=input('Ingrese la precisión:');
p1=subs(fx,p0);
p2=subs(fx,p1);
  p=p0-((p1-p0)^2/(p2-2*p1+p0));
cont=1;
error=abs(p-p0);
disp('n             p0              p1              p2              p               error')
fprintf('%2.0f %9.15f %9.15f %9.15f %9.15f %e\n', cont, double(p0),double(p1),double(p2),double(p),double(error))
while(error>e)
    cont=cont+1;
    p0=p;
   p1=subs(fx,p0);
p2=subs(fx,p1);
    p=p0-((p1-p0)^2/(p2-2*p1+p0));
    error=abs(p-p0);
    fprintf('%2.0f %9.15f %9.15f %9.15f %9.15f %e\n', cont, double(p0),double(p1),double(p2),double(p),double(error))
end
fprintf('\nEl valor aproximado de X es: %9.15f\n', double(p))

