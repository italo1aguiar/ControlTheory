function [R,aux]=cmr2(aux,k,pos,R)
[m,n]=size(R);
for i=1:n
    if aux(pos,i)~=0
    if R(k,aux(pos,i))==0
        R(k,aux(pos,i))=1;
        [R,aux]=cmr2(aux,k,aux(pos,i),R);
    end
    aux(pos,i)=0;
end
end