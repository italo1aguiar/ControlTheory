function xe = kal(y,u,G,T,Te,L,x1_0,P1_0,q,type)
A = [0 1; 0 -1/T];
B = [0; G/T];
C = [1 0];
D = [0];
[Ad,Bd,~,~] = c2dm(A,B,C,D,Te,'zoh');
w = chol(q,'lower')*randn(length(1),size(u,1));
v = chol(q,'lower')*randn(length(2),size(u,1));
xe = zeros(2,size(u,1));
xe(1:2,1) = x1_0;
P = P1_0;
Hn = [1 0];
Fn = Ad;
for i=1:size(u,1)-1
    y_pred = Hn*xe(1:2,i);
    c_xy = P*Hn';
    c_yy = Hn*P*Hn'+var(w); %q
    if(type=="optimal")
        k=c_xy*c_yy^-1;
    end
    if(type=="stationnaire")
        k=dlqe(Ad,Bd,C,q,q);
    end
    xe(1:2,i) = xe(1:2,i)+k*(y(i)-y_pred);
    P = P-k*c_xy';
    xe(1:2,i+1) = Fn*xe(1:2,i)+Bd *u(i);
    P = Fn*P*Fn'+Bd*q*Bd'; %q
end
xe = xe(1,:);
end