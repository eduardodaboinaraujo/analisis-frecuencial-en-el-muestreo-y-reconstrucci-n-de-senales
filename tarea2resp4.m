clear 
clc 
close all

Fs=512; %frecuencia de muestreo
To=1/Fs;
L=1024; %tamaño de la señal 
t=(0:L-1).*To;

%---- Serie de furier de la señal 
%  V(t)= 5(1-exp(-t))*u(t)
v=5*(1-exp(-t)).*heaviside(t);
%-------------------------------------------------------------------------%
%----- Espetro de frecuencias----%
Y=fft(v);
%-------------------------------------------------------------------------%
%--- grafica de la parte real de nuestra transformada 
figure(1);
plot(t,v)
title('Transformada de Furier');
grid on

figure(2);
plot(abs(Y))
title('Espetro de amplitud');
grid on

figure(3);
plot(imag(Y))
title('Espetro de fase');
grid on

% En el espetro de amplitud y el de fase podemos decir que tienen
% frecuencia tanto negativa como positivas la frecuencia de amplitud es la
% mitad a la de la señal original  el espetro de amplitud tiene simetria
% par y el de fase es impar para obtener esta datos es recomendable aplicar
% transformada de furier 