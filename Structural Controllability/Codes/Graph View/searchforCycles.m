function [C]=searchforCycles(A,B,Q,M)
C=zeros(1,column(A))
viz=listarVizinhos(A,M(column(M)))
if or(viz==0,sum(ismember(viz,M))>=column(viz))
    if column(M)<column(A)
            M=[M,zeros(1,(column(A)-column(M)))]
    end
        C=M
    return
else 
    for i=1:column(viz)
        if ~ismember(viz(i),M)
        M=[M,viz(i)]
        if sum(sum(C))~=0
            [C]=[C;searchforCycles(A,B,Q,M)]
        else
        [C]=searchforCycles(A,B,Q,M)
        end
        M(column(M))=[]
        end
    end
end
end