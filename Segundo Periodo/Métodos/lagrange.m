function lagrange(f,X,punto)

syms x

l0=((x-X(2))*(x-X(3))*(x-X(4)))/((X(1)-X(2))*(X(1)-X(3))*(X(1)-X(4)))
l1=((x-X(1))*(x-X(3))*(x-X(4)))/((X(2)-X(1))*(X(2)-X(3))*(X(2)-X(4)))
l2=((x-X(1))*(x-X(2))*(x-X(4)))/((X(3)-X(1))*(X(3)-X(2))*(X(3)-X(4)))
l3=((x-X(1))*(x-X(2))*(x-X(3)))/((X(4)-X(1))*(X(4)-X(2))*(X(4)-X(3)))

l0=double(subs(l0,punto))
l1=double(subs(l1,punto))
l2=double(subs(l2,punto))
l3=double(subs(l3,punto))

valor_aproximado=double(subs(f,x,X(1))*l0+subs(f,x,X(2))*l1+subs(f,x,X(3))*l2+subs(f,x,X(4))*l3)
valor_exacto=double(subs(f,x,punto))
error=double(abs(valor_exacto-valor_aproximado))