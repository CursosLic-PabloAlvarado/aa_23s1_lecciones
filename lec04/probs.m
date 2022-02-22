## EL5857 Aprendizaje Automático
## (C) 2022 Pablo Alvarado
## Material para la Lección 04

## En esta práctica se deberán calcular y graficar algunas
## probabilidades de letras en palabras de 5 letras en español.

## Cargar todas las palabras de 5 letras como un cell array.
## Ese archivo ha sido limpiado de caracteres extraños como espacios,
## paréntesis, o la letra O.
fid=fopen("palabras5ascii.txt");
O=textscan(fid,'%s');
fclose(fid);

## Por algún motivo, a todas las palabras excepto la última se les
## pone un espacio al final.  La siguiente línea pega todas las
## palabras en una sola línea, donde cada palabra ocupa 6 caracteres,
## siendo el último un espacio.
S=[double(strjoin({O{1,1}{:}})) 32];

## La ñ está codificada como N que no calza en la secuencia.  La vamos
## a pasar al 123 que es '}' después de z
S(S==78)=123;
S=S-double('a');

## Esto transforma las palabras cada una en una fila de D.  Se recorta
## la última columna de espacios.
D=reshape(S,6,length(S)/6)'(:,1:5);

pkg load statistics;

## Primera parte
## Probabilidad de cada letra

bins=unique(D(:));
[n,l]=hist(D(:),bins);

letras={'a','b','c','d','e','f','g','h','i',...
        'j','k','l','m','n','o','p','q','r',...
        's','t','u','v','w','x','y','z','ñ'};

p = n/sum(n);
        
bar(bins,p);
set(gca,'xtick',bins);
set(gca,'xticklabel',letras);


## Segunda parte
## Probabilidad condicional en la posición

figure(2,"name","p(letra|pos)");
hold off;
H=[];
for pos=[1:5]
  [N1,devnull]=hist(D(:,pos),bins);
  P=N1/sum(N1);

  H(:,pos)=P;
endfor

h=bar(bins,H);
set(gca,'xtick',bins);
set(gca,'xticklabel',letras);
set(h(1),"facecolor","r");
set(h(2),"facecolor","g");
set(h(3),"facecolor","b");
set(h(4),"facecolor","c");
set(h(5),"facecolor","m");

## Tercera parte: probabilidad de cada letra, dado que la anterior es
## otra letra

figure(3,"name","p(letra|ant=letra)")

D2=[D(:,1:2);D(:,2:3);D(:,3:4);D(:,4:5)];
[N,C]=hist3(D2,[length(bins),length(bins)]);
hist3(D2,[length(bins),length(bins)])


P=N/sum(N(:));

set(gca,'xtick',bins);
set(gca,'xticklabel',letras);
set(gca,'ytick',bins);
set(gca,'yticklabel',letras);

xlabel("actual");
ylabel("anterior");
