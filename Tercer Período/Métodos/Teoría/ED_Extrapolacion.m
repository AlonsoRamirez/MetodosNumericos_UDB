
clc;
clear variables;
syms x y t;
disp('Métodos de Extrapolación')
f=input('\nIntroduzca la función f(t,y): '); %(t*y)/(t^2+4)
a=input('Introduzca el valor a : ');%0
b=input('Introduzca el valor b : ');%1/25
h=input('Introduzca el valor h : ');%1/100
wo=input('Introduzca el valor de la condición inicial y(a)= '); %3
ED=input('\nED original en comillas: ');%'Dy=(t*y)/(t^2+4)'
cond=input('Valor inicial de la forma y(a)=k entre comillas: ');%'y(0)=3'
error=input('Introduzca el porcentaje de error : '); %1e-12
qi=[2 4 6 8 12 16 24 32]; yi=0; hi=0;
wi(1)=wo;
Y(1,1)=wo;
ti=a:h:b;
Ecua_dif=dsolve(ED,cond);
pretty(Ecua_dif)
hi(1)=h/qi(1);
t1=a+h;
i=1;
j=1;
Ecua_dif=[4 3.993793562466662 3.987672747569325 3.981635365358715 3.975679307227303];

while t1<=b
    fprintf('\n\nPara t%d=%3.2f  ho=%7.6f\n',i,t1,hi(1))
    yi=0;
    wi(j+1)=wi(j)+hi(j)*subs(f,{t,y},{a,wi(j)});
    wi(j+2)=wi(j)+2*hi(j)*subs(f,{t,y},{a+hi(j),wi(j+1)});
    Y(j+1)=subs(Ecua_dif,ti(i+1));
    yi(1,1)=1/2*(wi(j+2)+wi(j+1)+hi(j)*subs(f,{t,y},{a+2*hi(j),wi(j+2)}));
   Exacto=Y(j+1);
    tol=abs(yi(1,1)-Y(j+1));
    fprintf('\nw1=wo+hof(a,wo)=%10.15f',wi(2))
    fprintf('\nw2=wo+2hof(a+ho,w1)=%10.15f',wi(3))
    fprintf('\ny11=1/2[w2+w1+hof(a+2ho,w2)]=%10.15f',yi(1,1))
    fprintf('\nY(%7.6f)=%10.15f',t1,Exacto)
    fprintf('\n|Y(%7.6f)-y11|=%e\n',t1,tol)
    k=2; n=1;
    while tol>error
        hi(n+1)=(t1-a)/qi(k);
        wi(j+1)=wi(j)+hi(n+1)*subs(f,{t,y},{a,wi(j)}); l=j+1;
        for m=1:qi(k)-1
            wi(l+1)=wi(l-1)+2*hi(n+1)*subs(f,{t,y},{a+(l-1)*hi(n+1),wi(l)});
            l=l+1;
        end
        if qi(k)==4
            yi(2,1)=1/2*(wi(5)+wi(4)+hi(2)*subs(f,{t,y},{a+4*hi(n+1),wi(5)}));
            yi(2,2)=yi(2,1)+(yi(2,1)-yi(1,1))/3;
            tol=abs(yi(2,2)-Exacto);
            fprintf('\n\nCalculando y22 ')
            fprintf('ho=%7.6f\n',hi(n+1))
            fprintf('\nw1=wo+h1*f(a,wo)=%10.15f',wi(2))
            fprintf('\nw2=wo+2*h1*f(a+h1,w1)=%10.15f',wi(3))
            fprintf('\nw3=w1+2*h1*f(a+2h1,w2)=%10.15f',wi(4))
            fprintf('\nw4=w2+2*h1*f(a+3h1,w3)=%10.15f',wi(5))
            fprintf('\ny21=1/2[w4+w3+h1f(a+4h1,w4)]=%10.15f',yi(2,1))
            fprintf('\ny22=y21+1/3(y21-y11)=%10.15f',yi(2,2))
            fprintf('\n|Y(%7.6f)-y22|=%e\n',t1,tol)
        end
        if qi(k)==6
            yi(3,1)=1/2*(wi(7)+wi(6)+hi(n+1)*subs(f,{t,y},{a+6*hi(n+1),wi(7)}));
            yi(3,2)=yi(3,1)+4/5*(yi(3,1)-yi(2,1));
            yi(3,3)=yi(3,2)+(yi(3,2)-yi(2,2))/8;
           tol=abs(yi(3,3)-Exacto);
            fprintf('\n\nCalculando y33 ')
            fprintf('ho=%7.6f\n',hi(n+1))
            fprintf('\nw1=wo+h2f(a,wo)=%10.15f',wi(2))
            fprintf('\nw2=wo+2*h2*f(a+h2,w1)=%10.15f',wi(3))
            fprintf('\nw3=w1+2*h2*f(a+2h2,w2)=%10.15f',wi(4))
            fprintf('\nw4=w2+2*h2*f(a+3h2,w3)=%10.15f',wi(5))
            fprintf('\nw5=w3+2*h2*f(a+4h2,w4)=%10.15f',wi(6))
            fprintf('\nw6=w4+2*h2*f(a+5h2,w5)=%10.15f',wi(7))
            fprintf('\ny31=1/2[w6+w5+h2f(a+6h2,w6)]=%10.15f',yi(3,1))
            fprintf('\ny32=y31+4/5(y31-y21)=%10.15f',yi(3,2))
            fprintf('\ny33=y32+1/8(y32-y22)=%10.15f',yi(3,3))
            fprintf('\n|Y(%7.6f)-y33|=%e\n',t1,tol)
        end
        if qi(k)==8
            yi(4,1)=1/2*(wi(9)+wi(8)+hi(n+1)*subs(f,{t,y},{a+8*hi(n+1),wi(9)}));
            yi(4,2)=yi(4,1)+9/7*(yi(4,1)-yi(3,1));
            yi(4,3)=yi(4,2)+1/3*(yi(4,2)-yi(3,2));
            yi(4,4)=yi(4,3)+1/15*(yi(4,3)-yi(3,3));
            tol=abs(yi(4,4)-Exacto);
            fprintf('\n\nCalculando y44 ')
            fprintf('ho=%7.6f\n',hi(n+1))
            fprintf('\nw1=wo+h3f(a,wo)=%10.9f',wi(2))
            fprintf('\nw2=wo+2*h3*f(a+h3,w1)=%10.15f',wi(3))
            fprintf('\nw3=w1+2*h3*f(a+2h3,w2)=%10.15f',wi(4))
            fprintf('\nw4=w2+2*h3*f(a+3h3,w3)=%10.15f',wi(5))
            fprintf('\nw5=w3+2*h3*f(a+4h3,w4)=%10.15f',wi(6))
            fprintf('\nw6=w4+2*h3*f(a+5h3,w5)=%10.15f',wi(7))
            fprintf('\nw7=w5+2*h3*f(a+6h3,w6)=%10.15f',wi(8))
            fprintf('\nw8=w6+2*h3*f(a+7h3,w7)=%10.15f',wi(9))
            fprintf('\ny41=1/2[w8+w7+h3f(a+8h3,w8)]=%10.15f',yi(4,1))
            fprintf('\ny42=y41+9/7(y41-y31)=%10.15f',yi(4,2))
            fprintf('\ny43=y42+1/3(y42-y32)=%10.15f',yi(4,3))
            fprintf('\ny44=y43+1/15(y43-y33)=%10.15f',yi(4,4))
            fprintf('\n|Y(%7.6f)-y33|=%e\n',t1,tol)
        end
        n=n+1;
        k=k+1;
    end        
    t1=t1+h;
    j=1;
    hi(j)=(t1-a)/qi(j);
    i=i+1;
end