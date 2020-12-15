function [C]=isCtrl(A,B,flag)
    disp("Controllaybility Matrix")
    C=ctrb(A,B)
    display(C)
    [cm,n]=size(C')
    if n>rank(C')
        if flag==1
       disp("Controllability Gramian")
       Wc=gram(A,B)
        end
        disp("Uncontrollable")
    end
    if n==rank(C')
        if flag==1
       disp("Controllability Gramian")
       Wc=gram(A,B)
        end
        disp("Controllable")
    end
end
    