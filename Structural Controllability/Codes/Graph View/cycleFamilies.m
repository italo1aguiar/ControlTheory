function [CF]=cycleFamilies(A,C)
CF=zeros(1,column(C))
contador1=0;
contador2=0;
for i=1:rows(A)
    for j=1:rows(C)
        if sum(ismember(nonzeros(A(i,:))',nonzeros(C(j,:))'))==0
            if sum(sum(CF))==0
                CF=[nonzeros(A(i,:))',nonzeros(C(j,:))']
                CF=[CF,zeros(1,column(A)-column(CF))]
            else
                aux=[nonzeros(A(i,:))',nonzeros(C(j,:))']
                CF=[CF;aux,zeros(1,column(CF)-column(aux))]
            end
        else
        contador1=contador1+1   
        end
        if contador1==rows(C)
        contador2=contador2+1
        end
    end
    contador1=0;
    if contador2==rows(A)
    return
    end
end
[CF]=cycleFamilies(CF,C)
end