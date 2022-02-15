#!/usr/bin/octave-cli

## Cargue los datos en el archivo 'escazu'.dat
D=load("escazu.dat");

## Extraiga la columna de áreas y precios
area=D(:,1);
precios=D(:,4);

## Extraiga min-max de áreas y precios
amin=min(area);
amax=max(area);

pmin=min(precios);
pmax=max(precios);


## Use las ecuaciones normales para calcular los parámetros de
## regresión lineal
X=[ones(rows(area),1) area];
theta=inv(X'*X)*X'*precios;
# theta=pinv(X)*precios;


## Grafique los puntos originales y la recta de regresión lineal con
## al menos 100 puntos

a=linspace(amin,amax,100);
aa=[ones(rows(a'),1) a'];

pp=aa*theta;

figure(1,"name","Regresión lineal");
hold off;
plot(area,precios,"*");

hold on;
plot(a',pp,"linewidth",3);

## ¿Cómo podemos modificar lo anterior para hacer una regresión
## polinomial?


