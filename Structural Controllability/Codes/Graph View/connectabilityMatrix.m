function [R]=connectabilityMatrix(A)
[m,n]=size(A);
aux=zeros(n);
for i=1:n
    for j=1:n
    if A(i,j)==1
        for k=1:n
        if aux(i,k)==0
            aux(i,k)=j;
            break
        end
        end
    end
    end
end
k=1;
R=zeros(n);
while k<=n
    [R]=connectabilityMatrixRecursive(aux,R,k);
    k=k+1;
end
end

