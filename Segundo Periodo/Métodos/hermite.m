function [A]=hermite(X,y,G)
n=length(X);
A=zeros(n,n);
A(:,1)=y';
k=1;
for j=2:n
    for i=j:n
       if A(i-1,j-1)==A(i,j-1)
           A(i,j)=G(k);
           k=k+1;
       else
        A(i,j)=(A(i,j-1)-A(i-1,j-1))/(X(i)-X(i-j+1));
       end
    end
end
syms x
P=A(1,1)+A(2,2)*(x-X(1))+A(3,3)*(x-X(1))*(x-X(2))+A(4,4)*(x-X(1))*(x-X(2))*(x-X(3))+...
  A(5,5)*(x-X(1))*(x-X(2))*(x-X(3))*(x-X(4))+ A(6,6)*(x-X(1))*(x-X(2))*(x-X(3))*(x-X(4))*(x-X(5))+...
  A(7,7)*(x-X(1))*(x-X(2))*(x-X(3))*(x-X(4))*(x-X(5))*(x-X(6))+A(8,8)*(x-X(1))*(x-X(2))*(x-X(3))*(x-X(4))*(x-X(5))*(x-X(6))*(x-X(7))
valor_aproximado=double(subs(P,x,0.95))
f=sin(exp(x)-2);
valor_exacto=double(subs(f,0.95))

