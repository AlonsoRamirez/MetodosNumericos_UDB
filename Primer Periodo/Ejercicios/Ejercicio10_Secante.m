clc
clear variables
syms x
fprintf('Ejercicio 10 GUIA 1 MEN \n')
fx=input('Ingresar la función:'); %1000*pi*((x^2)*0.498 - (x^3)/3) - 960*((4/3)*pi*0.498^3)
p0=input('Ingresar el valor inicial p0:'); %1.107
p1=input('Ingresar el valor inicial p1:'); %1.108
e=input('Ingresar la precisión:');
fp0=subs(fx,p0);
fp1=subs(fx,p1);
p2=p1-((fp1*(p1-p0))/(fp1-fp0));
error=abs(p2-p1);
cont=1;
disp('n             p0               p1                 p2              error         ')
fprintf('%2.0f %9.15f %9.15f %9.15f  %e\n',cont, double(p0),double(p1),double(p2),double(error))
while(error>e)
   cont=cont+1;
   p0=p1;
   p1=p2;
   fp0=subs(fx,p0);
   fp1=subs(fx,p1);
   p2=p1-((fp1*(p1-p0))/(fp1-fp0));
   error=abs(p2-p1);
   fprintf('%2.0f %9.15f %9.15f %9.15f  %e\n',cont, double(p0),double(p1),double(p2),double(error))     
end
fprintf('El valor aproximado es: %9.15f',double(p2))

