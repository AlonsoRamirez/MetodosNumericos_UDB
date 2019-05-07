clc
clear variables
syms x
disp('Ejercicio 7 Guia 1 MEN')
T1 = 146.93; T = (T1 - 32)*(5/9) + 273.15;
Pc = 3390e3;
Tc = 126.2;
P = 715e3;
R = 0.2968;
a = (27*(R*Tc)^2)/(64*Pc);
b = (R*Tc)/(8*Pc);
% Sección de datos finales a manejar
fx = input('Ingrese la función:');%(P + a/(x^2))*(x - b) - R*T
p0 = R*T/P;
e=input('Ingrese la precisión:');
fp0=subs(fx,p0);
dfx=diff(fx,x);
dfx0=subs(dfx,p0);
p=p0-(fp0/dfx0);
cont=1;
error=abs(p-p0);
disp('n             p0                p            error')
fprintf('%2.0f %9.15f %9.15f %e\n',cont,double(p0),double(p),double(error))
while(error>e)
    cont=cont+1;
    p0=p;
    fp0=subs(fx,p0);
    dfx0=subs(dfx,p0);
    p=p0-(fp0/dfx0);
    error=abs(p-p0);
    fprintf('%2.0f %9.15f %9.15f %e\n',cont,double(p0),double(p),double(error))
end
fprintf('\nEl valor X que se busca es: %9.15f', double(p))