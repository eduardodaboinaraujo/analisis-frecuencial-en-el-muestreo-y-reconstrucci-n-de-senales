clear 
clc 
close all

% ---- Sistema de tercer orden con comportamiento sub-amortiguado ---- %
s = tf('s');
G=(10)/((s^2+2*s+2)*(s+10));
%----------------------------------------------------------------------%
% ---- Frecuencia del sistema a estudiar ---- %
Frmx=bandwidth(G);
T=5*Frmx;
To=1/T;
%----------------------------------------------------------------------%
% ---- Tomamos distintos tiempoo de muestreo ---- %
To2=0.4;
To3=0.6;
To4=0.8;
%----------------------------------------------------------------------%
% ---- Discretizamos el sistema por el metodo ZOH toamndo en cuenta distintos tiempos de muestro  ---- %
Gz=c2d(G,To,'zoh');
Gz2=c2d(G,To2,'zoh');
Gz3=c2d(G,To3,'zoh');
Gz4=c2d(G,To4,'zoh');
%------------------------------------------------------------------------------------------------------%

step(G)
hold on
step(Gz,'k')
hold on
step(Gz2,'+y')
hold on
step(Gz3,'--r')
hold on
step(Gz4,'*g')
title('Sistema de Tercer orden sub-amortiguado');
legend('continua','Discreta To=0.1430','Discreta To=0.4','Discreta To=0.6','Discreta To=0.8');
grid on

% En la grafica se puede contatar que a menor tiempo de muestreo mas
% precisa es la cantidad de muestras que se tomaran y a mayor tiempo de muestreo se ve que
% entre muesta y muestra existe hay una mayor distancia y en esos casos se
% puede perder informacion de la señal original 