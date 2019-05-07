function p=fsis39(t,w)
p=zeros(size(w));
p=[11/94 0;0 11/94]*w+[((901/3)*sin(3*t)-459*cos(3*t))/94; ((-1615/3)*sin(3*t)-680*cos(3*t))/94];
end