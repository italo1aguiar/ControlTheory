function [A,col]=cleanBack(A,col,n)
for i=1:n
        if sum(A(col,:))==0
            break;
        else
            if A(col,i)==1
                col=i;
                [A]=cleanEdges(A,col,n);
                [A,col]=cleanBack(A,col,n);
            end
        end
    end
end