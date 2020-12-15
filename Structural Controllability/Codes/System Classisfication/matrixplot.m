function matrixplot(A,B,C,D)
figure
subplot(2,2,1)
imagesc(A)
axis equal; axis tight;
title("Matrix A")
colorbar
subplot(2,2,2)
imagesc(B)
axis equal; axis tight;
title("Matrix B")
colorbar
subplot(2,2,3)
imagesc(C)
axis equal; axis tight;
title("Matrix C")
colorbar
subplot(2,2,4)
imagesc(D)
axis equal; axis tight;
title("Matrix D")
colorbar
end