clc;
clear variables;
syms x;
disp('INTERPOLACIÓN Y APROXIMACIÓN POLINOMIAL')
disp('Método de Neville')
fprintf('\n');

disp('¿Cómo desea introducir los datos?')
disp('1) X ^ Y dados en una tabla.');
disp('2) X en tabla y Y como función f(x).');
opcion = input('\nOpción: ');



punto = input('\nIntroduzca el valor a aproximar : ');

switch opcion
    case 1
        f=input('\nIntroduzca los datos X = [X0,X1,X2,..., Xn-1] : '); 
        g=input('Introduzca los datos Y = [Q00,Q10,Q20,..., Q(n-1,0)] : '); %ESCRIBIRLOS EN PARCIAL
        fx=f;
        fy=g;
        
        for i=1:length(fx)
           fprintf('\nQ%1.0f0=%9.15f\n',i-1,double(fy(i)))
        end
        
    case 2
        f=input('\nIntroduzca los datos X = [X1,X2,X3,..., Xn] : ');
        g=input('Introduzca la función equivalente a Y, es decir f(x): ');
        fx=f;
        fy=subs(g,f);
        fp=subs(g,punto);%punto exacto
        
        for i=1:length(fx)
            fprintf('\nQ%1.0f0=%9.15f\n',i-1,double(fy(i)))
        end
end  

n = length(fx);
Q=zeros(n,n); %Creando la matriz de Q

Q(:,1) = fy; %La columna 1 de la matriz corresponde a los f(x), es decir los Y de los datos datos

for j = 2:n %Se accede a la segunda columna
    for i = j:n
        strQ = strcat('((x-x',num2str(i-j),')*Q',num2str(i-1),num2str(j-1-1),' -(x-x',num2str(i-1),')*Q',num2str(i-1-1),num2str(j-1-1),')/(x',num2str(i-1),' - x',num2str(i-j),')');
        Q(i,j) = ((punto-fx(i+1-j))*Q(i,j-1) - ((punto-fx(i))*Q(i-1,j-1)))/(fx(i) - fx(i+1-j));
        fprintf('\nQ(%2.0f,%2.0f) = %s = %9.15f',i-1,j-1,strQ,double(Q(i,j)))
    end
end

%Mostrando la matriz
%format long;
%disp(Q);
%format;

fprintf('\n\nEl valor aproximado es: %9.15f',Q(n,n))

if (opcion == 2)
    exacto = subs(g,punto);
    error = abs(Q(n,n) - exacto);
    fprintf('\nEl valor exacto es: %9.15f', double(exacto))
    fprintf('\nEl error de aproximación es: %e\n',double(error))
end