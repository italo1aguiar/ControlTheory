function [B]=minVertextoCtrl(A)
[m,n]=size(A);
B=zeros(m,1);
C=A;
for i=1:n
    if and(sum(A(i,:))==0,sum(A(:,i))==0)
        B(i,1)=1;
    end
end
nonacessed=0;
for i=1:n
    if sum(A(i,:))==0
    B(i,1)=1;
        if nonacessed==0
            nonacessed=i;
        else
            nonacessed=[nonacessed,i];
        end
    end
end
if nonacessed~=0
for i=1:length(nonacessed)
    [A]=cleanEdges2(A,nonacessed(i),n);
end
end
while sum(sum(A))~=0
    maximum=0;
    col=0;
    for j=1:n
        if maximum<sum(A(:,j))
            maximum=sum(A(:,j));
            col=j;
        end
    end
    [A]=cleanEdges2(A,col,n);
    [A,col]=cleanBack2(A,col,n);
    B(col,1)=1;
end
[B]=isItMinimal(C,B,n,nonacessed);
end