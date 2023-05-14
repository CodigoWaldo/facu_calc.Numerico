function [x,L,U]= Crout_vect(A,b)
  
  n = length(A(:,1));
  U = eye(n,n);
  L = zeros(n,n);
  for i=1:n % recorremos la diagonal principal
    U(i, i+1:n) = A(i, i+1:n)/A(i,i);
    
    A(i:n,i+1:n) = A(i:n,i+1:n) - A(i:n,i)*U(i,i+1:n);
  endfor
  
  L=A;
  
  y = sust_adel(L,b);
  x = sust_atras(U,y); 
  
endfunction
