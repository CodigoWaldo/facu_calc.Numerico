function [x] = gauss(A,b)
n=length(A(1,:));

for k=1:n
m = A(k+1:n,k)/A(k,k);
b(k+1:n) = b(k+1:n) - m*b(k);
A(k+1:n,k:n) = A(k+1:n,k:n) - m*A(k,k:n);
endfor

x=sust_atras(A,b);
endfunction