function [A]=Neville_valores(x,y,punto)
n=length(x);
A=zeros(n,n);
A(:,1)=y';
for j=2:n
    for i=j:n
         A(i,j) = vpa((punto-x(i-j+1))*A(i,j-1) - ((punto-x(i))*A(i-1,j-1)))/(x(i) - x(i-j+1));
    end
end
val_aprox = vpa(A(n,n))


    