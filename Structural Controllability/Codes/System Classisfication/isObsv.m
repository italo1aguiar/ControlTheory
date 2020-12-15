function [O]=isObsv(A,C,flag)
    disp("Observability Matrix")
    O=obsv(A,C);
    display(O);
    [m,n]=size(O);
    if n>rank(O)
        if(flag==1)
            disp("Observability Gramian")
            Wo=gram(A',C');
            display(Wo);
        end
        disp("Unobservable")
    end
    if n==rank(O)
         if(flag==1)
            disp("Observability Gramian")
            Wo=gram(A',C');
            display(Wo);
        end
        disp("Observable")
    end
end
    