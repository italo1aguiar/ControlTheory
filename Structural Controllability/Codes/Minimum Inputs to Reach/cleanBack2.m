function [A,col]=cleanBack2(A,col,n)
    k=1;
    pilha=col;
   while k<=length(pilha) 
    for i=1:n
        if sum(A(pilha(k),:))~=0
            if A(pilha(k),i)==1
                pilha=[pilha,i];
                [A]=cleanEdges2(A,i,n);
            end
        end
    end
    k=k+1;
   end
   col=pilha(k-1);
end