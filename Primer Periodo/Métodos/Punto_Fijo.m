%fplot(@(x) f, interval)

clc;
clear variables;
syms x;

fprintf('Punto Fijo \n\n')
gx = input('Ingrese la función g [x=g(x)]: ');  %Si hay un x^4 + 2*x^2 -x-3, hacer factor comun entre las x
p0 = input('Ingrese el valor de p0: '); %usando solve para igualar a 0
e = input('Ingrese el valor de precisión: ');
cont = 1;

p = subs(gx, p0);
error = abs(p - p0);

disp(' n            p0                p              error')
fprintf('%2.0f %9.15f %9.15f %e\n', cont, double(p0), double(p), double(error))

while error > e
    cont = cont + 1;
    p0 = p; 
    p = subs(gx, p0);
    error = abs(p - p0);
    fprintf('%2.0f %9.15f %9.15f %e\n', cont, double(p0), double(p), double(error))
end

fprintf('\nEl valor de P es: %9.15f \n', double(p))


% if (abs(subs(diff(gx),p0)) <= 1) 
%     
% else
%     disp('Ingrese otra función g(x)')
% end

