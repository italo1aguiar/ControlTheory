function [e,flag]=isStable(A)
    e=eig(A);
    [m,n]=size(e);
    flag=0;
    if (sum(e(:,1)>0)) > 0;
            disp("unstable ")
            return
    end
    minpol=minpoly(A);
    raizes=roots(minpol);
    [m2,n2]=size(raizes);
    comparing=zeros(m2,n2);
    s=0;
    for i=1:m2
        if raizes(m2,1)==0
        s=s+1;
        end
    end
    s=sum(comparing<=raizes(:,1))
    if s>1
           disp("unstable")
           return
    end
    if s==1
           disp("marginally stable")
           flag=1;
           return
    end
    if s==0
           disp("Assymptotically stable")
           flag=1;
           return
    end
end
    