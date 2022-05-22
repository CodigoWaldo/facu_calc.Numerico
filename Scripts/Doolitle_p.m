function [x,Ar,L,U,P] = Doolitle_p(A,b)
# Calculo del sistema Ax=b usando factorizacion
# Doolitle con vector de indices "r"
n = length(A(:,1));
Ar = [A b]; # Matriz Ampliada (incluye el vector b)
r = [1:n]'; % vector de indices
epsilon = 1e-9;

for k = 1:n % lazo para los pivotes
     [pmax, p] = max(abs(Ar(r(k:n),k))); # Minimo entero p >k donde encontramos 
                                     # el maximo valor absoluto
    if pmax < epsilon
      disp('Los posibles pivotes son nulos')
    endif
    
     p = p(1) + k-1; % actualizo la posicion del pivote a numeracion global
     
      if p~=k
    
        r([p,k]) = r([k,p]); # actualizamos el pivote
      endif
  P = eye(n)(r,:);
     
     Ar(r(k+1:n),k) = Ar(r(k+1:n),k) /Ar(r(k),k); # incorporamos tanto L como U dentro de A
                                               # no usamos "m"
     
     Ar(r(k+1:n),k+1:n+1) = Ar(r(k+1:n),k+1:n+1) - Ar(r(k+1:n),k)*Ar(r(k),k+1:n+1); 
     
endfor

# Planteamos el sistema A
L = eye(n) + tril(Ar(r,1:n),-1);
U = triu(Ar(r,1:n),0);

br=P*b;

y = sust_adel(L,br);
x = sust_atras(U,y);

endfunction

