function [J,e,flag,Ctrl,Obsv,ab,bc,cd,dd]=sysSolution(A,B,C,D)
    [J]=jordanForm(A);
    [ab,bc,cd,dd]=canonform(A,B,C,D);
    [e,flag]=isStable(ab);
    [Ctrl]=isCtrl(ab,bc,flag);
    [Obsv]=isObsv(ab,cd,flag);
end