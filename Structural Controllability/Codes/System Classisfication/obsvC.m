function [C]=obsvC(A)
[m,n]=size(A);
C=zeros(n);
    for i=1:n
        if mod(i,2)==0
            C(i/2,i/2)=1;
            [flag]=isObsv2(A,C);
            if flag==1
                disp(C)
                for j=1:i
                    if mod(j,2)==0
                        C(j/2,j/2)=0;
                    if isObsv2(A,C)==0
                        C(j/2,j/2)=1;
                    end
                    end
                    if mod(j,2)~=0
                        C(n-(j-1)/2,n-(j-1)/2)=0;
                    if isObsv2(A,C)==0
                        C(n-(j-1)/2,n-(j-1)/2)=1;
                    end
                    end
                end
            return
            end
        end
        if mod(i,2)~=0
            C(n-(i-1)/2,n-(i-1)/2)=1;
            [flag]=isObsv2(A,C);
            if flag==1
                disp(C)
                 for j=1:i
                    if mod(j,2)==0
                        C(j/2,j/2)=0;
                    if isObsv2(A,C)==0
                        C(j/2,j/2)=1;
                    end
                    end
                    if mod(j,2)~=0
                        C(n-(j-1)/2,n-(j-1)/2)=0;
                    if isObsv2(A,C)==0
                        C(n-(j-1)/2,n-(j-1)/2)=1;
                    end
                    end
                end
                 return 
            end
        end
    end
    if flag==0
       error("system isn't observable")
    end
end