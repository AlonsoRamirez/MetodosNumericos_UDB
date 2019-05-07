


clc;
clear variables;
syms x;

fprintf('Bisección\n\n')
f = input('Ingrese la función f: '); % int(32.24+(1.924e-3)*x+(1.055e-5)*x^2-(3.596e-9)*x^3,x,315,x)-3265
a = input('Ingrese el valor de a: '); %410.575
b = input('Ingrese el valor de b: '); %410.585
e = input('Ingrese el valor de precisión: '); %1e-12
cont = 1;

fa = subs(f, a);
fb = subs(f, b);

if (fa * fb) < 0
    p = (a+b)/2;
    error = abs(subs(f, p));
    
    disp(' n            a                b                p              error')
    fprintf('%2.0f %9.15f %9.15f %9.15f %e\n', double(cont), double(a), double(b), double(p), double(error))
    while error > e 
        cont = cont + 1;
        fa = subs(f, a);
        fn = subs(f, p);
        
        if (fa * fn) < 0
            b = p;
        else
            a = p;
        end
        
        po = p;
        p = (a+b)/2;
        error = abs(p - po);
        fprintf('%2.0f %9.15f %9.15f %9.15f %e\n', cont, double(a), double(b), double(p), double(error))
        
    end
    
    fprintf('\nEl valor de P es: %9.15f \n', double(p))
    
    
else 
    disp('No hay cambio de signo en los valores ingresados')
end

