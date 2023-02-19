## Generemos muchos puntos aleatorios, tomados de una distribución
## uniforme
m=2000000; ## Número de puntos
bins=50;

## Acumulemos muestras aleatorias uniformemente distribuidas para
## ver comportamiento acumulado

figure(2,"name","Distribuciones acumuladas");
hold off;
for n=[1 2 3 4 5 10 20]
  title=sprintf(";%i datos;",n);

  d=sum(rand(n,m)-0.5,1);
  [nn,xx] = hist(d,bins,1); ## Muestre histograma normalizado
  dx=xx(2)-xx(1);
  plot(xx,nn/dx,title,"linewidth",2);
  hold on;
endfor
