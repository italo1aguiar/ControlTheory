function [viz]=listarVizinhos(A,M)
viz=0;
for i=1:column(A)
    if A(i,M)==1
      if viz==0
          viz=i;
      else
          viz=[viz,i]
      end
end
end