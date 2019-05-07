clc;
clear variables;
syms x;
disp('INTERPOLACIÓN Y APROXIMACIÓN POLINOMIAL')
disp('Interpolación y polinomio de Lagrange')
fprintf('\n');

disp('¿Cómo desea introducir los datos?')
disp('1) X ^ Y dados en una tabla.'); %Siempre igualar si aparecen logaritmos. Si da f(n), ese es el numero a aproximar
disp('2) X en tabla y Y como función f(x).');
disp('3) X en función x(y) y Y como tabla.');
opcion = input('\nOpción: ');

punto = input('\nIntroduzca el valor a aproximar : '); %0.63

switch opcion
    case 1
        f=input('\nIntroduzca los datos X = [X1,X2,X3,..., Xn] : '); %[0.2,0.4,0.6,0.8,1.0,1.2]
        g=input('Introduzca los datos Y = [Y1,Y2,Y3,..., Yn] : '); %[1.1787359,1.3104793,1.3899781,1.4140628,1.3817733,1.2943968]
        fx=f;
        fy=g;
    case 2
        f=input('\nIntroduzca los datos X = [X1,X2,X3,..., Xn] : ');
        g=input('Introduzca la función equivalente a Y, es decir f(x): ');
        fx=f;
        fy=subs(g,f);
        fp=subs(g,punto);%punto exacto
    case 3
        f=input('\nIntroduzca la función equivalente a los X es decir x(y): ');
        g=input('Introduzca los datos Y = [Y1,Y2,Y3,..., Yn] : ');
        fx=subs(f,g);
        fy=g;
        fp=subs(f,punto);%punto exacto
end  

grado = length(fx) - 1;
n = length(fx);
L=zeros();
fprintf('EL polinomio de Lagrange tiene grado%3.0f \n\n',double(grado));

%Creando las Ln 
for i=1:n
    numerador=1;
    denominador=1;
    cadena='';
    cadena1='';
    cadena2='';
    
    for j=1:n
        if i ~= j
            cont= j-1;
            cadena1=strcat(cadena1 , '(x-x' , num2str(cont) , ')' );
            cadena2=strcat(cadena2 , '(x' , num2str(i-1) , '-x' , num2str(j-1) , ')');
            numerador=numerador * (punto - fx(j)); 
            denominador=denominador *(fx(i)-fx(j));
        end
    end
        
    cadena=strcat(cadena,'(',cadena1, ')' , '/(' , cadena2 , ')' );
    L(i)=(numerador/denominador); %Calculando cada Ln (valor numérico)
    fprintf('L(%2.0f) = %s = %9.15f \n\n' ,(i-1), cadena , L(i) );
end

fprintf('P(x)= ')
for k=1:n
    fprintf(' L%2.0f(x)*F(X%2.0f)+ ',k-1,k-1)
end
fprintf('\n\n') 

index=length(L);
resp=0;
for k = 1:index
    resp= resp + (L(k)*fy(k));
end

fprintf('El valor aproximado  P(%1.5f)= %9.15f \n', double(punto) , double(resp));

if (opcion ~= 1)
    fprintf('El valor exacto es  F(%1.5f)= %9.15f \n', double(punto) ,double(fp));
    error = abs(fp - resp);
    fprintf('El error de aproximación es %e \n',double(error));
end
