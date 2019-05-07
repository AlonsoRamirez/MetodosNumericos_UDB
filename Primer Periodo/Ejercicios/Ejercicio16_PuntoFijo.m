clc;
clear variables;
syms x;
disp('Ejercicio 16 Guia 1 MEN')
%solve('32.24*(x - 399) + 0.001924*((x^2)/2 - (399^2)/2) + 1.055e-5*((x^3)/3 -(399^3)/3) - 3.596e-9*((x^4)/4 - (399^4)/4) - 2860 ')
gx = input('Ingrese la función Tf [x=g(x)]: ');  % ((32.24*399)+2860 - 0.001924*((x^2)/2 - (399^2)/2) - 1.055e-5*((x^3)/3 -(399^3)/3) + 3.596e-9*((x^4)/4 - (399^4)/4))/32.24
p0 = input('Ingrese el valor de T0: '); %481.12129
e = input('Ingrese el valor de precisión: '); %1e-12
cont = 1;
p = subs(gx, p0);
error = abs(p - p0);
disp(' n            T0                T              error')
fprintf('%2.0f %9.15f %9.15f %e\n', cont, double(p0), double(p), double(error))
while error > e
    cont = cont + 1;
    p0 = p; 
    p = subs(gx, p0);
    error = abs(p - p0);
    fprintf('%2.0f %9.15f %9.15f %e\n', cont, double(p0), double(p), double(error))
end
fprintf('\nEl valor de T es: %9.15f \n', double(p))