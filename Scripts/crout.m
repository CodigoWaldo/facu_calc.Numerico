function [L,U] = crout(A)
%clc
%clear

%A=input('Ingrese la matriz a factorizar: ');

%[m,n]=size(A);

%if n=m; %Verifica que la matriz sea cuadrada
  n =length(A(:,1));
  L=eye(n) %Crea unas matrices identidad L y U
  U=eye(n)
  
  for k=1:n;
    suma1=0;
    for p=1:k-1;
      suma1=suma1 + L(k,p)*U(p,k);
    end
    
    L(k,k)=A(k,k) - suma1; %Encuentra los elementos de la diagonal principal
    %Asumiendo U(k,k) como 1
    for i=k+1:n
      suma2=0;
      for p=1:k-1
        suma2=suma2 + L(i,p)*U(p,k);
      end
      %Encontramos la columna k de L
      L(i,k)= (A(i,k)- suma2)/U(k,k);
      
    end
    
    for j=k+1:n
      suma3=0;
      for p=k+1:n
        suma3= suma3 + L(k,p)*U(p,j);
      end
      %Encontramos la fila K de U
      U(k,j)=(A(k,j)-suma3)/L(k,k);
     end
  end
  
 L
 U

%  endif  
     
    