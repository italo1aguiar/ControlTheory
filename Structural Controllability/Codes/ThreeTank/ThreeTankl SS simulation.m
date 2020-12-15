%Three Tank State-Space simulation
A=[-6.7284*10^(-3) 0 6.7284*10^(-3); 0 -5.0085*10^(-2) 6.7284*10^(-3);6.7284*10^(-3) 6.7284*10^(-3) -1.3457*10^(-2) ]
B=[6.4935 0;0 6.4935;0 0 ]
C=[1 0 0 ; 0 1 0; 0 0 1]
D=[0 0 ; 0 0 ; 0 0]
u = [ones(1,10000) * 1.2e-4; ones(1,10000) * 0.6e-4];
ue=[0.4*10^(-4); 0.3*10^(-4)]
xe=[3.9353*10^(-2) 7.4884*10^(-4) 2.0051*10^(-2)]
tank=ss(A,B,C,D)
t=linspace(0,5000,10000);
y = lsim(tank, u - ue, t,xe);
plot(t, y-xe)

%[t,y]=sim("threetanksimulink") use the simulink with commands
%trim find the stationay