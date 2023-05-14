function [A,Afull, b, x0] = MatrizVigaBiEmpotrada(Nh, L, fj)
  # Armamos la matriz del ejercicio Nº 9 de la viga empotrada
  
  h = L/Nh; # subintervalos del dominio discreto.
  
  # armamos los vectores para generar luego los diagonales primarias y secundarias
  d0 = 6*ones(Nh-3,1);
  d1 = -4*ones(Nh-4,1);
  d2 = ones(Nh-5,1);
  
  # Generamos la matriz A del sistema A*nu = b
  
  Afull = diag(d0) + diag(d1,1) + diag(d2,2)+diag(d1,-1) + diag(d2,-2);
  
  b = (h^4)*fj*ones(Nh-3,1);
  
  x0 = zeros(Nh-3,1);
  
  # como matriz sparse
  #{
  D = ones(Nh-3,1);
  
  diagonales = [(1*(D)) (-4*(D)) (6*D) (-4*(D)) (1*(D))];
  A = spdiags(diagonales, [-2 -1 0 1 2], Nh-3, Nh-3);
  #}
endfunction
