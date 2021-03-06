function E=puntomedio(f,ya,g,e,a,b,h)
syms t y
T=a:h:b;
w(1)=ya;
exacta=dsolve(g,e); 
m=(b-a)/h;
for j=1:m
w(j+1)=w(j)+h*subs(f,{t,y},{T(j)+h/2,w(j)+h/2*subs(f,{t,y},{T(j),w(j)})});
end
Y=double(subs(exacta,t,T));
fprintf('            Ti                      Wi+1                    Yi');
fprintf('\n');
E=[T' w' Y'];
