clc
syms x
%¡OJOOOOO!
%Ejemplo de polinomio con 3x: 
%a0 + a1(x-x0) + a2(x-x0)(x-x0) + a3(x-x0)(x-x0)(x-x1) + a4(x-x0)(x-x0)(x-x1)(x-x1) + a5(x-x0)(x-x0)(x-x1)(x-x1)(x-x2)
%Al copiar la matriz, colocar cada uno de los 0's 
%Correspondiente a cada columna, al principio de la columna
fprintf('\n\n')
disp('Hermite por Diferencias Divididas')

funcion = input('\nLe fue dada la funcion (si=1, no=0): ');

if funcion == 1
   f = input('Digite la funcion f(x)= '); 
   df = diff(f,x)
   x = input('Digite los valores de x [x0,x1,...,xn]: ');
   y = subs(f,x);
   yd = subs(df,x);
else
   x = input('Digite los valores de x [x0,x1,...,xn]: ');
   y = input('Digite los valores de f(x)[f(x0),f(x1),...,f(xn)]: ');
   yd = input('Digite los valores de de f´(x) [f´(x0),f´(x1),...f´(xn)]: ');
end

p = input('Digite el valor de x a aproximar: ');

n = 2 * length(x);
D = zeros(n,n);

px = 1;
x2 = zeros(1,n);
y2 = zeros(1,n);

for i=1:2:n
   x2(i) = x(px);
   x2(i+1) = x(px);   
   
   y2(i) = y(px);
   y2(i+1) = y(px);
   
   px=px+1;
end

D(:,1) = y2';

for i=2:n
   for j=1:n-i+1
      num = D(j+1,i-1) - D(j,i-1);
      denom = x2(j+i-1)-x2(j);
      if denom == 0
         D(j,i) = yd((j+1)/2);
      else
         D(j,i) = num/denom;
      end      
   end   
end

disp('====================Matriz de Diferencias Divididas======================')
format long;
disp(D)
format;
disp('=========================================================================')

%----Construyendo polinomio simbólico----------
%----Construyendo polinomio simbólico----------
pol = 'a0 +';
for i=1:n-1
    fprintf('\na%2.0f = %9.15f', double(i-1), double(D(1,i))) %Mostrando valores de constantes 'a'
    pol = strcat(pol,' a', num2str(i));
    terms = '';
    for j=0:i-1
        terms = strcat(terms,'(x-x',num2str(j),')');
    end
    pol = strcat(pol, terms,' +');
end
fprintf('\na%2.0f = %9.15f', double(n-1), double(D(1,n)))
fprintf('\n\nH(x) = %s', pol) %Mostrando Polinomio simbólico



Pn = D(1,1);


k=1;
for i=2:n  
   S=1; 
   for j=1:i-1
      S = S*(p-x2(j));
     
   end
   
   Pn = Pn + D(1,i)*S;
end


fprintf('\n\nEl valor aproximado es: %9.15f',double(Pn));
if funcion == 1
    exacto = subs(f,p);
    error = abs(exacto-Pn);
    fprintf('\nEl valor exacto en la funcion es: %10.15f',double(exacto))
    fprintf('\nEl error es: %e\n\n',double(error))
end



