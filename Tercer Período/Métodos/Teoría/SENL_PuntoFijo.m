clc
clear variables
syms x1 x2 x3 x4 x5 t;
cont=1;
disp('Sistemas de ecuciones no lineales')
disp('Método de punto fijo')
disp('Trabajar con variables x1, x2, ..., xn')
m = input('Introduzca el # de funciones: ');

for i=1:1:m
    fprintf('Introduzca la funcion %d. x%d',i,i);
    %Despejar como en punto fijo del primer período
    % x1=(x1^2+x2^2+8)/10
    % x2=(x1*x2^2+x1+8)/10
    fi(i) = input('= ');
end

vi = input('Introduzca el vector fila de valores iniciales x^(0): ');%[0.95 0.95]
e = input('Introduzca el valor de tolerancia: ');%1e-4

disp('============================= Matriz de funciones =============================')
disp(fi)

switch m
    case 2
        xi = zeros(1,2);
        xi(cont,:) = subs(fi,{x1,x2},{vi(1),vi(2)});
        fprintf('\nx1= subs(G,{x1,x2},{x0(1),x0(2)})')
    case 3
        xi = zeros(1,3);
        xi(cont,:) = subs(fi,[x1,x2,x3],[vi(1),vi(2),vi(3)]);
        fprintf('\nx1= subs(G,{x1,x2,x3},{x0(1),x0(2),x0(3)})')
   
end

error = norm(xi(1,:)-vi(1,:),inf);

fprintf('\nx1=\n')
disp(xi)
fprintf('Error= %9.15e\n',error)

while (error > e)
    vi = xi(cont,:);
    cont = cont + 1;
    switch m
        case 2
            xi(cont,:) = subs(fi,{x1,x2},{vi(1),vi(2)});
            fprintf('\nx%d= subs(G,{x1,x2},{x%d(1),x%d(2)})',cont,cont-1,cont-1)
        case 3
            xi(cont,:) = subs(fi,[x1,x2,x3],[vi(1),vi(2),vi(3)]);
            fprintf('\nx%d= subs(G,{x1,x2,x3},{x%d(1),x%d(2),x%d(3)})',cont,cont-1,cont-1,cont-1)
        
    end

    error = norm(xi(cont,:)-xi(cont-1,:),inf);

    fprintf('\nx%d=\n',cont)
    disp(xi(cont,:))
    fprintf('Error= %9.15e\n',error)
end