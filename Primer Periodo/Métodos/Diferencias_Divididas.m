clc
clear variables
syms x;
disp('INTERPOLACIÓN Y APROXIMACIÓN POLINOMIAL')
disp('Método de diferencias divididas')
fprintf('\n');

disp('¿Cómo desea introducir los datos?')
disp('1) X ^ Y dados en una tabla.');%El dato que se pide será el X al simultanear ambas ecuaciones
disp('2) X en tabla y Y como función f(x).');
opcion = input('\nOpción: ');
punto = input('\nIntroduzca el valor a aproximar : ');
switch opcion
    case 1
        f=input('\nIntroduzca los datos X = [X1,X2,X3,..., Xn] : ');
        g=input('Introduzca los datos Y = [Y1,Y2,Y3,..., Yn] : ');
        fx=f;
        fy=g;
    case 2
        f=input('\nIntroduzca los datos X = [X1,X2,X3,..., Xn] : '); %[-0.85 -0.8 -0.75 -0.5 -0.4 -0.25]
        g=input('Introduzca la función equivalente a Y, es decir f(x): '); %log(17-6*x.^2)/log(19)
        fx=f;
        fy=subs(g,f);
        fp=subs(g,punto);%punto exacto
end  

grado = length(fx) - 1;
n = length(fx);
D = zeros(n,n);
fprintf('\nEl polinomio es de grado%2.0f\n\n' , double(grado));


%Creando la matriz de diferencias
k=1;
for j=1:n
   h=j-1;
   for i=k:n
       if j==1
         D(:,1) = fy;
      else
         D(i,j)=(D(i,j-1)-D(i-1,j-1))/(fx(i)-fx(i-h));  
       end
   end
   k=k+1;
end

%Creando el polinomio (en memoria con datos numéricos)
P = D(1,1);
for i=2:n

   Pstr = 1;
   for j=1:i-1
      Pstr = Pstr*(x - fx(j));
   end

   P = P + (D(i,i)*Pstr);
end

%----Construyendo polinomio simbólico----------
pol = 'a0 + ';
for i=1:n-1
   
    fprintf('a%2.0f = %9.15f\n', double(i-1), double(D(i,i)))
    pol = strcat(pol,'a', num2str(i));
    terms = '';
    for j=0:i-1
        terms = strcat(terms,'(x-x',num2str(j),')'); 
    end
    pol = strcat(pol, terms,' +');
end
fprintf('a%2.0f = %9.15f\n\n', double(n-1), double(D(n,n)))
for i=1:n-1
    fprintf('x%2.0f = %9.15f\n', double(i-1), double(fx(i)))
end


fprintf('\nP%2.0f(%2.3f) = %s',grado,punto,pol) %SUSTITUIR VALORES NUMERICOS AQUI


fprintf('\n****************** Matriz de diferencias ******************\n')
format long;
disp(D)



%-----------Resultados-----------------
aprox = subs(P,punto);
fprintf('\n\nEl valor aproximado es: %9.15f',double(aprox))

if (opcion == 2)
    error = abs(fp - aprox);
    fprintf('\nEl valor exacto es: %9.15f', double(fp))
    fprintf('\nEl error de aproximación es: %e\n',double(error))
end