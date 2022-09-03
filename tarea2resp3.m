clear 
clc 
close all

% ---- Cantidad de armonicos que vamos a mostrar ----%
N= 10;
%----------------------------------------------------%
% ---- Señal periodica a estudiar ----%
x= -1:0.01:1;
k=9;
f= x*k;
%----------------------------------------------------%
% ---- Resolucion de la serie de furier ----%
A=0;
sum = A;

for n = 1:1:N
    A(n)=0;
    B(n)= 2*((-1)^(n+1))/n;
    sum = A(n)*cos(n*x*k) + B(n)*sin(n*x*k)+sum;
    
end
%----------------------------------------------------%
% ---- Calculamos el transformada de furier para mostrar la grafica de la amplitud y fase ----%
Y=fft(f);
%---------------------------------------------------------------------------------------------%

figure(1)
plot(x,f)
hold on
plot(x,sum)
title('Serie de furier de una señal periodica');
legend('Señal original','Señal en serie de furier');
grid on

% figure(2);
% plot(abs(Y))
% title('Espetro de amplitud');
% grid on
% 
% figure(3);
% plot(imag(Y))
% title('Espetro de fase');
% grid on

% En el espetro de amplitud y el de fase podemos decir que tienen
% frecuencia tanto negativa como positivas la frecuencia de amplitud es la
% mitad a la de la señal original  el espetro de amplitud tiene simetria
% par y el de fase es impar para obtener esta datos es recomendable aplicar
% transformada de furier 