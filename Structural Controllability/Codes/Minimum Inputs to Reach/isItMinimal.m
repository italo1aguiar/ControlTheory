function [B]=isItMinimal(A,B,n,nonacessed)
C=A;
for i=1:n
    if B(i)==1
    [C]=cleanEdges2(A,i,n);
    end
    for j=1:n
    if ~ismember(j,nonacessed)
    if and(and(B(j)==1,i~=j),sum(A(j,:))==0)
        B(j)=0;
    end
    end
C=A;
end
end