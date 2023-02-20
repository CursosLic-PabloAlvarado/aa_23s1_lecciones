1;

## Creando algunos datos artificiales

a = linspace(0,2*pi,360);
X = [cos(a)+1;sin(a)+1];


A=[2 0.1;0.1 1]; B=[-0.5 0];

## Evalúe eficientemente x' A x + B x  donde x es cada columna de X
 
## Z= zeros(1,size(X,2));  ## << corregir esto
Z= sum(X.* (A*X));

hold off;
plot3(X(1,:),X(2,:),Z,"r","linewidth",3);
xlabel('x_1');
ylabel('x_2');
daspect([1,1,5]);
grid on;

## Sobreponga el paraboloide completo

[XX,YY] = meshgrid (-1:0.2:3,-2:0.2:2);

NX= [XX(:),YY(:)]';
ZZ= reshape(sum(NX.* (A*NX)),size(XX));

hold on;
mesh(XX,YY,ZZ);
