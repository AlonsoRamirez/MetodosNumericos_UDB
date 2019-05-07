clc
clear variables
syms x;
disp('CEROS DE POLINÓMIOS')
disp('Método de Horner')
coef = input('Introduzca el vector de coeficientes del polinomio [ax^n ax^n-1 ... ax^0]: '); %[1 4 5 -6 -7] por ejemplo
x0 = input('Introduzca el valor x0: ');
e = input('Introduzca el valor de precisión: ');
cont = 1;

temp1 = [];
res1 = [];
temp2 = [];
res2 = [];

for i = 1:length(coef)
    if (i == 1)
        temp1(1) =  coef(1);
        res1(1) = coef(1);
    else
        temp1(i) = res1(i-1)*x0;
        res1(i) = coef(i) + temp1(i);
    end
end

for i = 1:length(res1)-1
    if (i == 1)
        temp2(1) = res1(1);
        res2(1) = res1(1);
    else
        temp2(i) = res2(i-1)*x0;
        res2(i) = res1(i) + temp2(i);
    end
end

bop = res1(length(res1));
boq = res2(length(res2));
x1 = x0 - (bop/boq);
error = abs(x1 - x0);

fprintf('\n       N =%2.0f         Xo = %9.15f\n',cont,double(x0))
fprintf('%9.9f  ',double(coef))
fprintf('\n')
fprintf('%9.9f  ',double(temp1))
fprintf('\n')
fprintf('%9.9f  ',double(res1))
fprintf('\n')
fprintf('%9.9f  ',double(temp2))
fprintf('\n')
fprintf('%9.9f  ',double(res2))
fprintf('\n')
fprintf('bop = %9.15f\n', double(bop))
fprintf('boq = %9.15f\n', double(boq))
fprintf('X%2.0f = %9.15f\n', cont, double(x1))
fprintf('error = %e\n', double(error))



%disp(' n          x0                bop                boq                  xn             error')
%fprintf('%2.0f  %9.15f  %9.15f  %9.15f  %9.15f  %9.2e\n',cont,x0, bop, boq, x1 ,error)

while error > e
    x0 = x1;
    cont = cont + 1;
    
    for i = 1:length(coef)
        if (i == 1)
            temp1(1) =  coef(1);
            res1(1) = coef(1);
        else
            temp1(i) = res1(i-1)*x0;
            res1(i) = coef(i) + temp1(i);
        end
    end

    for i = 1:length(res1)-1
        if (i == 1)
            temp2(1) = res1(1);
            res2(1) = res1(1);
        else
            temp2(i) = res2(i-1)*x0;
            res2(i) = res1(i) + temp2(i);
        end
    end

    bop = res1(length(res1));
    boq = res2(length(res2));
    x1 = x0 - (bop/boq);
    error = abs(x1 - x0);
    
    fprintf('\n       N =%2.0f         Xo = %9.15f\n',cont,double(x0))
fprintf('%9.9f  ',double(coef))
fprintf('\n')
fprintf('%9.9f  ',double(temp1))
fprintf('\n')
fprintf('%9.9f  ',double(res1))
fprintf('\n')
fprintf('%9.9f  ',double(temp2))
fprintf('\n')
fprintf('%9.9f  ',double(res2))
fprintf('\n')
    fprintf('bop = %9.15f\n', double(bop))
    fprintf('boq = %9.15f\n', double(boq))
    fprintf('X%2.0f = %9.15f\n', cont, double(x1))
    fprintf('error = %e\n', double(error))
    
    %fprintf('%2.0f  %9.9f  %9.9f  %9.9f  %9.9f  %9.2e\n',cont,x0, bop, boq, x1 ,error)
end

fprintf('\n El valor aproximado de X es = %9.15f\n', x1) 
