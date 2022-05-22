function [L] = Cholesky_vectorizada(A)
% Factorizacion de Cholesky vectorizada

n = length(A(:,1)); %medimos el orden de la matriz
L = zeros(n,n); % ponemos en cero la matriz que sera la triang. inferior.
for k = 1:n
    L(k,k) = sqrt(A(k,k) - L(k,1:k-1)*L(k,1:k-1)');
    L(k+1:n,k) = (A(k+1:n,k) - L(k+1:n,1:k-1)*L(k,1:k-1)')/L(k,k);
end
    


