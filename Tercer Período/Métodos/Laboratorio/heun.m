function E=heun(f,ya,g,e,a,b,h)
syms t y
T=a:h:b;
w(1)=ya;
exacta=dsolve(g,e); 
m=(b-a)/h;
for i=1:m
 w(i+1) = w(i)+((h/4)*(subs(f,{t,y},{T(i),w(i)})))+(((3/4)*h)*(subs(f,{t,y},{(T(i)+((2/3)*h)),(w(i)+(((2/3)*h)*(subs(f,{t,y},{T(i),w(i)}))))})));
end
Y=double(subs(exacta,t,T));
fprintf('            Ti                      Wi+1                    Yi');
fprintf('\n');
E=[T' w' Y'];