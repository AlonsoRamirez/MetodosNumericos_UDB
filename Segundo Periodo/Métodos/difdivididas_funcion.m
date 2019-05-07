function [A]=difdivididas_funcion(f,X,y,punto)
syms x
n=length(X);
A=zeros(n,n);
A(:,1)=y';
for j=2:n
    for i=j:n
         A(i,j) = (A(i,j-1)-A(i-1,j-1))/(X(i) - X(i-j+1));
    end
end
P=A(1,1)+A(2,2)*(x-X(1))+A(3,3)*(x-X(1))*(x-X(2))+A(4,4)*(x-X(1))*(x-X(2))*(x-X(3))+ ... +  
A(5,5)*(x-X(1))*(x-X(2))*(x-X(3))*(x-X(4))+A(6,6)*(x-X(1))*(x-X(2))*(x-X(3))*(x-X(4))*(x-X(5))+ ... +
A(7,7)*(x-X(1))*(x-X(2))*(x-X(3))*(x-X(4))*(x-X(5))*(x-X(6))+A(8,8)*(x-X(1))*(x-X(2))*(x-X(3))*(x-X(4))*(x-X(5))*(x-X(6))*(x-X(7))
aproximado=vpa(subs(P,punto))
exacto=vpa(subs(f,punto))
error=double(abs(aproximado-exacto))
%f es la funcion entre comillas simples

    