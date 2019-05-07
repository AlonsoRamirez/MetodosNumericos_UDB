%-Esau villatoro
%funciones

%para obtener volumen o area d de una caja 
% v(x,y)=x^2*h
%x^2*Lxh=area donde L=numero de lados
%despejar para obtenr la funcion requerida

%volumen de un abrevadero 
% V=L[(1/2)*pi*r^2 - r^2asin(h/r) - sqrt(h^2-r^2)]

%otra opcion
%V=L[(1/2)*pi*r^2-(x*h-r^2*o)]
%profundidad=r-h
%area del triangulo redondeado = r^2*o
%area triangulo normal=x*h/2
%area del circulo=pi*r^2
%-----------------------------------------------------------
%dos postes
%distancia del cable total= y+z
%aplicar pitagoras 
%dt=distancia entre postes
%y=sqrt(h1^2+(dt-x)^2)
%z=sqrt(x^2+h2^2)
----------------------------------------
%glorieta base cilindrica superior cono
%volumen del cono=(pi*r^2*h)/3
%Area del cono= pi*r*g = pi*r*(sqrt(r^2+h^2))

%Area del cilindro=2*pi*r*h
%Volumne del cilindro = pi*r^2*h

%Vt=Vci + Vco// de aqui despejo h del cono
%As=Aci + Aco // aqui sustituyo h del cono

%As=pi*r*(sqrt(r^2+((vt-pi*r^2*h1)/((1/3)*pi*r^2))^2))+2*pi*r*h1 //para encontrar el radio
%solve('226.456017504791190=pi*x*(sqrt(x^2+((379.991118430775150-pi*x^2*6)/((1/3)*pi*x^2))^2))+2*pi*x*6')//para encontrar el radio

%hcono=(vt-pi*x^2*hci)/((1/3)*pi*x^2)
%subs((379.991118430775150-pi*x^2*6)/((1/3)*pi*x^2),4.374070072737680) //para altura
%solve('x=(379.991118430775150-pi*4.374070072737680^2*6)/((1/3)*pi*4.374070072737680^2)')//para altura
%-------------------------------------------------------------------------------------------------
%canal
%at=cos(o)h*sin(o)*x+sin(o)*x*x
%solve('77.062477015988691=cos(x)*(100/12)*sin(x)*(100/12)+sin(x)*(100/12)*(100/12)')

%grados= (rad*180)/pi
%-----------------------------------------------------------------------------------------
%ventana cuadrada con semicirculo
%area circulo =pi*r^2
%area cuadro =x*y
%perimetro circulo =2*pi*r
%perimetro del cuadro=l+l+l+l

%at=aC+aSC/2
%at= xy+ (1/2)*pi*r^2
%perimetro=pi*r+x+y+y=pi*r+2*y+x
%//despejo y de la ecuacion del area y sustituyo y en la ecuacion del perimetro
%((pi*x)/2)+((2*at)/x)-((pi*x)/4)+x-pt// f(x) para el programa
%solve('((pi*x)/2)+((2*(78.420619901184542))/x)-((pi*x)/4)+x-(600/12)')//valor dimension de x

%y=(at-(0.5)*pi*((x/2)/2)^2)/x
%solve('x=(78.420619901184542-(0.5)*pi*(3.60/2)^2)/3.60')//valor dimension de y


%de celcius a fahrenheit
%F=C*1.8+32

%de fahrenheit a celcius 
%C=(F-32)/1.8

%de kelvin a celsius
%C=K-273.15

%de celsius a kelvin
%K=C + 273.15

%de kelvin a fahrenheit
%F= (9(K-273.15)/5) + 32

%figuras geometricas 
%circunferencia
%a=2pir
%d=a/pi
%circulo
%a=pi*r^2
%elipse
%a=(pi*a*b)/4
%cuadrado
%a=a^2
%p=4a
%rectangulo
%a=b*h
%p=2(b+h)