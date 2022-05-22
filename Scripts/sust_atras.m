function x = sust_atras(A,b)
# proceso de sustitucion hacia atrás vectorizada
n=length(A(1,:));
x = zeros(n,1); # inicializamos la solucion
%x(n) = b(n)/A(n,n); % primer calculo con la ultima ecuacion

   for i=n:-1:1 
  
       s = b(i); # vector lado derecho (matriz ampliada)
    
       x(i) = (s - A(i,i+1:n)*x(i+1:n))/A(i,i);
    
   endfor 
endfunction
