function [rhoAsor] = RadioEspectralsor(A,wsor)
% descomponemos la matriz A para calcular la matriz de iteracion
[L D U]=DescomponerMatriz(A); 

[rhoAsor pos]=max(abs(eig(-inv(D+wsor*L)*((wsor-1)*D+wsor*U))));

endfunction