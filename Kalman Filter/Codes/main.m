%% Filtrage de Kalman
clc;clear;
% 1 - Synthese de l'entrée du système
Duree = 2;
Amp = 0.1;
Delta = 100*10^-3;
Te = 10^-3;
[u,t] = entree(Duree,Amp,Delta,Te);
figure
plot(t,u);
title("Singal d'entrée")
xlabel("t")
ylabel("u(t)")
% 2 - Modélisation et simulation du système
G = 50;
T = 20*10^-3;
L = 512;
x1 = [0; 0];
[y,x] = simule(u,G,T,Te,L,x1);
figure
hold on
plot(t,y)
plot(t,x)
title("Simulation du système")
xlabel("t")
ylabel("y(t)")
legend("codeur","état")
hold off
%% 3 - Estimation par filtrage de Kalman
clc;
q = 0.01; %variance du bruit blanc
x1_0 = [0; 0]';
P1_0 = [0 0;0 0];
x_opt = kal_2(y,u,G,T,Te,L,x1_0,P1_0,q);
figure
hold on
plot(x,'red');
plot(x_opt,'blue');
hold off
legend("original","kalman optimal")

%% 4 - Simulations

clc;
q = 0.001; %variance du bruit blanc
x1_0 = [0.05; 0];
P1_0 = [0.05^2 0; 0 0];
x_opt = kal(y,u,G,T,Te,L,x1_0,P1_0,q,"stationnaire");
x_stat = kal(y,u,G,T,Te,L,x1_0,P1_0,q,"optimal");
figure
hold on
plot(x,'red');
plot(x_opt,'blue');
plot(x_stat,'green');
title("q = 0.001")
hold off
legend("original","kalman optimal","kalman stationnaire")

q = 0.1; %variance du bruit blanc
x1_0 = [0.05; 0];
P1_0 = [0.05^2 0; 0 0];
x_opt = kal(y,u,G,T,Te,L,x1_0,P1_0,q,"stationnaire");
x_stat = kal(y,u,G,T,Te,L,x1_0,P1_0,q,"optimal");
figure
hold on
plot(x,'red');
plot(x_opt,'blue');
plot(x_stat,'green');
hold off
title("q = 0.1")
legend("original","kalman optimal","kalman stationnaire")

q = 1; %variance du bruit blanc
x1_0 = [0.05; 0];
P1_0 = [0.05^2 0; 0 0];
x_opt = kal(y,u,G,T,Te,L,x1_0,P1_0,q,"stationnaire");
x_stat = kal(y,u,G,T,Te,L,x1_0,P1_0,q,"optimal");
figure
hold on
plot(x,'red');
plot(x_opt,'blue');
plot(x_stat,'green');
hold off
title("q = 1")
legend("original","kalman optimal","kalman stationnaire")

q = 10; %variance du bruit blanc
x1_0 = [0.05; 0];
P1_0 = [0.05^2 0; 0 0];
x_opt = kal(y,u,G,T,Te,L,x1_0,P1_0,q,"stationnaire");
x_stat = kal(y,u,G,T,Te,L,x1_0,P1_0,q,"optimal");
figure
hold on
plot(x,'red');
plot(x_opt,'blue');
plot(x_stat,'green');
hold off
title("q = 10")
legend("original","kalman optimal","kalman stationnaire")

q = 0.01; %variance du bruit blanc
x1_0 = [0.05; 0];
P1_0 = [0.05^2 0; 0 0];
T = 25.10^-3;
x_opt = kal(y,u,G,T,Te,L,x1_0,P1_0,q,"stationnaire");
x_stat = kal(y,u,G,T,Te,L,x1_0,P1_0,q,"optimal");
figure
hold on
plot(x,'red');
plot(x_opt,'blue');
plot(x_stat,'green');
hold off
title("T = 25 ms")
legend("original","kalman optimal","kalman stationnaire")
 