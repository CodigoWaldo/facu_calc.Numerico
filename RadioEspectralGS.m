function [rhoAGS] = RadioEspectralGS(A)
% descomponemos la matriz A para calcular la matriz de iteracion
[L D U]=DescomponerMatriz(A); 

[rhoAGS pos]=max(abs(eig(-inv(D+L)*(U))));


endfunction