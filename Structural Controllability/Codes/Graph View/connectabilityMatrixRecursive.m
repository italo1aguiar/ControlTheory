function [R]=connectabilityMatrixRecursive(aux,R,k) %Passar R e aux sendo igual à A para a primeira execução
[m,n]=size(R);
for i=1:n
    if aux(k,i)~=0
        if R(k,aux(k,i))==0
        R(k,aux(k,i))=1;
        [R,aux]=cmr2(aux,k,aux(k,i),R);
        aux(k,i)=0;
        end
        end
    end
end