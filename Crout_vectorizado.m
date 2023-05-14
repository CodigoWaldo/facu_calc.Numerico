function [L,U] = Crout_vectorizado(L)
  
  n = length(L(:,1));
  U = eye(n,n);
  
  for i=1:n % recorremos la diagonal principal
    U(i, i+1:n) = L(i, i+1:n)/L(i,i);
    
    L(i:n,i+1:n) = L(i:n,i+1:n) - L(i:n,i)*U(i,i+1:n);
  endfor
    
endfunction
