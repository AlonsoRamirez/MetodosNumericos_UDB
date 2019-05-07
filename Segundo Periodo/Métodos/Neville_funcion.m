%f es para la funcion y siempre a ingresar entre comillas simples
%digitsOld = digits(17); para cambiar precisión
function [A]=Neville_funcion(f,X,y,punto)
syms x
n=length(X);
A=zeros(n,n);
A(:,1)=y';
for j=2:n
    for i=j:n
         A(i,j) = vpa((punto-X(i-j+1))*A(i,j-1) - ((punto-X(i))*A(i-1,j-1)))/(X(i) - X(i-j+1));
    end
end
val_aprox = vpa(A(n,n))
val_exacto= vpa(subs(f,punto))
error= double(abs(val_exacto-val_aprox))


    