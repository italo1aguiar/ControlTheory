function [A]=cleanEdges(B,col,n)
    A=B;
    for i=1:n
        if A(i,col)==1    
            A(i,:)=0;
            for j=1:n
                if A(j,i)==1
                    A(j,:)=0;
                    [B]=cleanEdges(A,j,n);
                    A=B;
                end
            end
            [B]=cleanEdges(A,i,n);
            A=B;
        end
    end
end