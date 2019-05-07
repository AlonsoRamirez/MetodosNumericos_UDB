clc
clear variables
syms x;
disp('INTERPOLACIÓN Y APROXIMACIÓN POLINOMIAL')
disp('Método de Trazadores Cúbicos')
fprintf('\n');

res=input('La ecuacion le fue dada (si=1/no=0) :');
 if res==1
   r=input('- Introduzca la Funcion F(x)             : ');
end
X=input('- Introduzca los valores de x [x0,x1,x2...,xn]       : ');
n=length(X);

if res==1
    for i=0:n-1
    Y(i+1)=subs(r,X(i+1));
    end
else
Y=input('- Introduzca los valores de y: ');
end
z=input('- Introduzca el valor a aproximar   : ');

for i=0:n-1
   A(i+1)=Y(i+1);
end

for i=0:n-2
   H(i+1)=X(i+2)-X(i+1);
end
fprintf('\n');
fprintf('\n');

%valores de a(n)
fprintf (' Valores de f(x): \n');
for i=0:n-1
   fprintf (' a(%1.0f) = %9.15f',i,A(i+1));
   fprintf ('\n');
end
fprintf('\n');




%valores de h(n)
fprintf (' Espaciado de cada uno de los nodos: \n');
for i=0:n-2
   fprintf (' h(%2.0f) = %2.0f',i,H(i+1));
   
   fprintf ('\n');
end

fprintf('\n');

fprintf(' El valor de n es: %1.0f\n',n-1);

fprintf('\n');

for i=1:n-2
   b(i)=2*(H(i)+H(i+1));
end
   
   for i=1:n-2
      d(i)=3*(A(i+2)-A(i+1))/H(i+1)-3*(A(i+1)-A(i))/H(i);
   end
   
   
   
   fprintf ('El sistema de ecuaciones es: \n');
   for i=1:n-2
      fprintf('J%1.0f:\n(%3.8f) *C%1.0f + (%3.8f)*C%1.0f + (%3.8f)*C%1.0f = %9.15f\n',i,double(H(i)),i,double(b(i)),i,double(H(i+1)),i+1,double(d(i)));
   end
   
    fprintf ('Las ecuaciones simbólicas es: \n');
    for i=1:n-2
      fprintf('J%1.0f:\nH%1.0f*C%1.0f + 2(H%1.0f +H%1.0f)C%1.0f + H%1.0fC%1.0f = 3(A%1.0f - A%1.0f)/H%1.0f - 3(A%1.0f - A%1.0f)/H%1.0f\n',i,i-1,i-1,i-1,i,i,i,i+1,i+1,i,i,i,i-1,i-1)
   end
   
   D=zeros(n,n);
   B=zeros(1,n);
   
   for i=2:n-1
      B(i)=b(i-1);
   end
   D=diag(B);
   
   V=zeros(1,n-1);
   for i=1:n-2
      V(i)=H(i);
   end
   for i=1:n-1
      D(i+1,i)=V(i);
   end
   S=zeros(1,n-1);
   for i=2:n-1
      S(i)=H(i);
   end
   for i=1:n-1
      D(i,i+1)=S(i);
   end
   D(1,1)=1;
   D(n,n)=1;
   
   T=zeros(1,n);
   for i=2:n-1
      T(i)=d(i-1);
   end
   
   R=T';
   C=D\R;
   
   fprintf('\n');
   
   fprintf('Los valores de las constantes de C son:\n');
   fprintf('C(0) = 0 \n');
   for i=2:n
   fprintf('C(%1.0f) = %9.15f\n',i-1,double(C(i)));
   end
   fprintf('\n');
   
   cont=0;
   for i=1:n
   if z > X(i)
      cont=cont+1;
   end
   end
   
 
   o=(C(cont+1)-C(cont))/(3*H(cont)); %d
   fprintf('d(%1.0f)=(C(%1.0f)-C(%1.0f))/(3*H(%1.0f))\n',cont,cont+1,cont,cont);
   fprintf('El valor de la constante d(%1.0f) es : %9.15f\n',cont-1,double(o));
   fprintf('\n');
   
   f=(A(cont+1)-A(cont))/(H(cont-1))-((H(cont-1)*(2*C(cont)+C(cont+1)))/3); %b
   fprintf('b(%1.0f)=(A(%1.0f)-A(%1.0f))/(H(%1.0f))-((H(%1.0f)*(2*C(%1.0f)+C(%1.0f)))/3)\n',cont,cont+1,cont,cont-1,cont-1,cont,cont+1);
   fprintf('El valor de la constante b(%1.0f) es : %9.15f\n',cont-1,double(f));
   fprintf('\n');
   

M=A(cont)+f*(z-X(cont))+C(cont)*(z-X(cont))^2+o*(z-X(cont))^3;


strPol = strcat('a',num2str(cont-1),' + b',num2str(cont-1),'(x -',num2str(X(n-1)),') + c',num2str(cont-1),'(x -',num2str(X(n-1)),')^2 + d',num2str(cont-1),'(x -',num2str(X(n-1)),')^3');
fprintf('Polinomio simbólico: %s\n', strPol)

fprintf('El resultado final es: %9.15f',double(M));
      
fprintf('\n');
