function [A]=cleanEdges2(B,col,n)
A=B;
pilha=col;
k=1;
  while k<=length(pilha) 
    node=pilha(k);
    for i=1:n
        if A(i,node)==1    
            A(i,:)=0;
            pilha=[pilha,i];
        end
    end
    k=k+1;
  end
end