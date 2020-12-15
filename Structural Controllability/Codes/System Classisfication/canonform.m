function [ab,bc,cd,dd] = canonform(A,B,C,D)
[ab,bc,cd,dd,P]=canon(A,B,C,D,'modal');
disp("modal form:")    
disp("A")
disp(ab)
disp("B")
disp(bc)
disp("C")
disp(cd)
disp("D")
disp(dd)
matrixplot(ab,bc,cd,dd)
end