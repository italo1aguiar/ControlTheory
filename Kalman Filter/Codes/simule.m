function [y,x] = simule(u,G,T,Te,L,x1)

A = [0 1; 0 -1/T];
B = [0; G/T];
C = [1 0];
D = [0];
[Ad,Bd,Cd,Dd] = c2dm(A,B,C,D,Te,'zoh');
sys = ss(Ad,Bd,Cd,Dd,Te);
t = linspace(0,size(u,1)*Te,Te);
[x,~] = lsim(sys,u,t,x1,'zoh');
y = round(x*L/2/pi)*2*pi/L;

end