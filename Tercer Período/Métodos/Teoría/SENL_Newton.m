clc
clear variables
format long e
syms x1 x2 x3 ;
cont = 1;

disp('Método de Newton')
disp('Trabajar con variables x1, x2, ..., xn y las ecuaciones deben estar igualadas a cero (No se despeja ninguna variable)')
fi=input('Introduzca las funciones en forma de vector:'); %[4*x1^2-20*x1+(1/4)*x2^2+8;(1/2)*x1*x2^2+2*x1-5*x2+8]
m=length(fi);
vi = input('Introduzca el vector COLUMNA "[v1;v2;...;vn]" de valores iniciales x^(0): '); %[0.2;1.5]
e = input('Introduzca el valor de tolerancia: '); %1e-12

switch m
    case 2
        J = [diff(fi(1,1),x1) diff(fi(1,1),x2);diff(fi(2,1),x1) diff(fi(2,1),x2)];
        Ji(1,1)=double(subs(J(1,1),[x1,x2],[vi(1),vi(2)]));
        Ji(1,2)=double(subs(J(1,2),[x1,x2],[vi(1),vi(2)]));
        Ji(2,1)=double(subs(J(2,1),[x1,x2],[vi(1),vi(2)]));
        Ji(2,2)=double(subs(J(2,2),[x1,x2],[vi(1),vi(2)]));
        Fi(1,1)=double(subs(fi(1,1),[x1,x2],[vi(1),vi(2)]));
        Fi(2,1)=double(subs(fi(2,1),[x1,x2],[vi(1),vi(2)]));
    case 3
        J = [diff(fi(1,1),x1) diff(fi(1,1),x2) diff(fi(1,1),x3);diff(fi(2,1),x1) diff(fi(2,1),x2) diff(fi(2,1),x3);diff(fi(3,1),x1) diff(fi(3,1),x2) diff(fi(3,1),x3)];
        Ji(1,1)=double(subs(J(1,1),[x1,x2,x3],[vi(1),vi(2),vi(3)]));
        Ji(1,2)=double(subs(J(1,2),[x1,x2,x3],[vi(1),vi(2),vi(3)]));
        Ji(1,3)=double(subs(J(1,3),[x1,x2,x3],[vi(1),vi(2),vi(3)]));
        Ji(2,1)=double(subs(J(2,1),[x1,x2,x3],[vi(1),vi(2),vi(3)]));
        Ji(2,2)=double(subs(J(2,2),[x1,x2,x3],[vi(1),vi(2),vi(3)]));
        Ji(2,3)=double(subs(J(2,3),[x1,x2,x3],[vi(1),vi(2),vi(3)]));
        Ji(3,1)=double(subs(J(3,1),[x1,x2,x3],[vi(1),vi(2),vi(3)]));
        Ji(3,2)=double(subs(J(3,2),[x1,x2,x3],[vi(1),vi(2),vi(3)]));
        Ji(3,3)=double(subs(J(3,3),[x1,x2,x3],[vi(1),vi(2),vi(3)]));
        Fi(1,1)=double(subs(fi(1,1),[x1,x2,x3],[vi(1),vi(2),vi(3)]));
        Fi(2,1)=double(subs(fi(2,1),[x1,x2,x3],[vi(1),vi(2),vi(3)]));
        Fi(3,1)=double(subs(fi(3,1),[x1,x2,x3],[vi(1),vi(2),vi(3)]));

end

disp('============================= Matriz de funciones =============================')
disp(fi)
disp('============================= Matriz J =============================')
disp(J)

fprintf('\nIteración %d :\n',cont)
fprintf('\nF(x0)=\n')
for i=1:m
    fprintf('     %10.15e\n',double(Fi(i,1)))
end
fprintf('\nJ(x0)=\n')
for i=1:m
    for j=1:m
        fprintf('     %10.15e',double(Ji(i,j)))
    end
    fprintf('\n')
end

xk=vi-inv(Ji)*Fi;
fprintf('\nx(1)=x(0)-inv(J0)*F(x(0))\n')
for i=1:m
    fprintf('     %10.15e\n',double(xk(i,1)))
end
error = double(norm(xk-vi,inf));
fprintf('Error = %9.15e\n',double(error))
%error=norm(x(k)-x(k-1),inf) escribirlo de forma simbolica para todos
%error=norm(x1-x0,inf) por ejemplo

   while (error > e)
    vi = xk;
    cont = cont + 1;
    
switch m
    case 2
        J = [diff(fi(1,1),x1) diff(fi(1,1),x2);diff(fi(2,1),x1) diff(fi(2,1),x2)];
          Ji(1,1)=double(subs(J(1,1),[x1,x2],[vi(1),vi(2)]));
        Ji(1,2)=double(subs(J(1,2),[x1,x2],[vi(1),vi(2)]));
        Ji(2,1)=double(subs(J(2,1),[x1,x2],[vi(1),vi(2)]));
        Ji(2,2)=double(subs(J(2,2),[x1,x2],[vi(1),vi(2)]));
        Fi(1,1)=double(subs(fi(1,1),[x1,x2],[vi(1),vi(2)]));
        Fi(2,1)=double(subs(fi(2,1),[x1,x2],[vi(1),vi(2)]));
    case 3
        J = [diff(fi(1,1),x1) diff(fi(1,1),x2) diff(fi(1,1),x3);diff(fi(2,1),x1) diff(fi(2,1),x2) diff(fi(2,1),x3);diff(fi(3,1),x1) diff(fi(3,1),x2) diff(fi(3,1),x3)];
 Ji(1,1)=double(subs(J(1,1),[x1,x2,x3],[vi(1),vi(2),vi(3)]));
        Ji(1,2)=double(subs(J(1,2),[x1,x2,x3],[vi(1),vi(2),vi(3)]));
        Ji(1,3)=double(subs(J(1,3),[x1,x2,x3],[vi(1),vi(2),vi(3)]));
        Ji(2,1)=double(subs(J(2,1),[x1,x2,x3],[vi(1),vi(2),vi(3)]));
        Ji(2,2)=double(subs(J(2,2),[x1,x2,x3],[vi(1),vi(2),vi(3)]));
        Ji(2,3)=double(subs(J(2,3),[x1,x2,x3],[vi(1),vi(2),vi(3)]));
        Ji(3,1)=double(subs(J(3,1),[x1,x2,x3],[vi(1),vi(2),vi(3)]));
        Ji(3,2)=double(subs(J(3,2),[x1,x2,x3],[vi(1),vi(2),vi(3)]));
        Ji(3,3)=double(subs(J(3,3),[x1,x2,x3],[vi(1),vi(2),vi(3)]));
        Fi(1,1)=double(subs(fi(1,1),[x1,x2,x3],[vi(1),vi(2),vi(3)]));
        Fi(2,1)=double(subs(fi(2,1),[x1,x2,x3],[vi(1),vi(2),vi(3)]));
        Fi(3,1)=double(subs(fi(3,1),[x1,x2,x3],[vi(1),vi(2),vi(3)]));

end
    fprintf('\nIteración %d :\n',cont)
    fprintf('\nF(x%d)=\n',cont-1)
for i=1:m
    fprintf('     %10.15e\n',double(Fi(i,1)))
end

fprintf('\nJ(x%d)=\n',cont-1)
for i=1:m
    for j=1:m
        fprintf('     %10.15e',double(Ji(i,j)))
    end
    fprintf('\n')
end

xk=vi-inv(Ji)*Fi;
fprintf('\nx(%d)=x(%d)-inv(J%d)*F(x(%d))\n',cont,cont-1,cont-1,cont-1)
for i=1:m
    fprintf('     %10.15e\n',double(xk(i,1)))
end
error = double(norm(xk-vi,inf));
fprintf('Error = %9.20e\n',double(error))
    end


