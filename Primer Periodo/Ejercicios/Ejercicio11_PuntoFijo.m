clc;
clear variables;
syms m;
disp('Ejercicio 11 Guia 1 MEN')
v= input('Ingrese la velocidad: '); %55.6
c= input('Ingrese el coeficiente: '); %13.5
t= input('Ingrese el tiempo: '); %13.55
gx = input('Ingrese la función g [m=g(m)]: '); %
p0 = input('Ingrese el valor de m0: '); %87.225
e = input('Ingrese el valor de precisión: '); %1e-12
cont = 1;

m = subs(gx, p0);
error = abs(m - p0);

disp(' n            m0                m              error')
fprintf('%2.0f %9.15f %9.15f %e\n', cont, double(p0), double(m), double(error))

while error > e
    cont = cont + 1;
    p0 = m; 
    m = subs(gx, p0);
    error = abs(m - p0);
    fprintf('%2.0f %9.15f %9.15f %e\n', cont, double(p0), double(m), double(error))
end

fprintf('\nEl valor de m es: %9.15f \n', double(m))