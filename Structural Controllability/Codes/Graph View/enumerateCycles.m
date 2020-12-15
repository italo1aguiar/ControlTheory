function [C]=enumerateCycles(A,B)
n=column(B)
M=0
Q=[A,B]
C=0;
Q1=[ones(column(B),rows(A)),zeros(column(B),column(B))]
Q=[Q;Q1]
for i=1:n
    for j=1:rows(B)
    if B(j,i)==1
            M=j
            if sum(sum(C))==0
            [C]=searchforCycles(A,B,Q,M);
            else
            C=[C;searchforCycles(A,B,Q,M)];
    break;
            end
    end
    M=0;
end
end