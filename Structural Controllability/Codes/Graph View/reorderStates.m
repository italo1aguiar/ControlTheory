function [R,S,T,W,P,M,W3]=reorderStates(A)
[m,n]=size(A);
[R]=connectabilityMatrix(A);
S=R & R';
T=R & (~R)';
W=[1:n;sum(T)];
W3=W;
W2=sort(W,2);
marked=0;
for i=1:n
    for j=1:n
        if W2(2,i)==W(2,j)
            if ~ismember(W(1,j),marked)
            W2(1,i)=W(1,j);
            marked=[marked,W(1,j)];
            break;
            end
        end
    end
end
W=W2;
P=zeros(n);
%for i=1:n
 %   P(:,i)=A(:,W(1,i));
%end
for i=1:n
    P(W(1,i),i)=1;
end
M=P'*A*P;
end