%{ 
--Este ejercicio muestra como evaluar una solución implícita en Matlab
 syms t y
 f=y^2/2+log(y)-(1/10)*exp(-5*t^2)-2/5;
 ts=0:1/800:7/800;
 J=subs(f,t,ts)
J =
 
[ log(y) + y^2/2 - 1/2, exp(-1/160000)/8 + log(y) + y^2/2 - 5/8, exp(-1/40000)/8 + log(y) + y^2/2 - 5/8, exp(-9/160000)/8 + log(y) + y^2/2 - 5/8, exp(-1/10000)/8 + log(y) + y^2/2 - 5/8, exp(-1/6400)/8 + log(y) + y^2/2 - 5/8, exp(-9/40000)/8 + log(y) + y^2/2 - 5/8, exp(-49/160000)/8 + log(y) + y^2/2 - 5/8]

Y1=double(solve(J(1)))

Y1 =

      1.000000000000000e+00 + 0.000000000000000e+00i
    

Y2=double(solve(J(2)))

Y2 =
 
      1.000000390623779e+00 + 0.000000000000000e+00i
      
Y3=double(solve(J(3)))

Y3 =

    
      1.000001562480469e+00 + 0.000000000000000e+00i
Y4 =

      1.000003515526125e+00 + 0.000000000000000e+00i

Y5=double(solve(J(5)))

Y5 =

      1.000006249687510e+00 + 0.000000000000000e+00i

Y6=double(solve(J(6)))

Y6 =

      1.000009764862100e+00 + 0.000000000000000e+00i

Y7=double(solve(J(7)))

Y7 =

      1.000014060918087e+00 + 0.000000000000000e+00i
Y8=double(solve(J(8)))

Y8 =

      1.000019137694390e+00 + 0.000000000000000e+00i
f=5*t^2+2*t-5*y;
diff(f,t)+diff(f,y)*f
 
ans =
 
- 25*t^2 + 25*y + 2
 
diff(ans,t)+diff(ans,y)*f
 
ans =
 
125*t^2 - 125*y
 
diff(ans,t)+diff(ans,y)*f
 
ans =
 
- 625*t^2 + 625*y
 
diff(ans,t)+diff(ans,y)*f
 
ans =
 
3125*t^2 - 3125*y
 
diff(ans,t)+diff(ans,y)*f
 
ans =
 
- 15625*t^2 + 15625*y
neville t para x y w para y
sec(x)^2=1+tan(x)^2
cos(2*t)=cos(t)^2-sin(t)^2
sin(2*t)=2*sin(t)*cos(t)
cos(t)^3=(1/4)*(3*cos(t)-cos(3*t))
sin(t)^3=(1/4)*(3*sin(t)-sin(3*t))
sin(t)^2=(1/2)*(1-cos(2*t))
cos(t)^2=(1/2)*(1+cos(2*t))
%}