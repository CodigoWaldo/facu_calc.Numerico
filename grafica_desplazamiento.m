function grafica_desplazamiento(Nh1,Nh2,Nh3,L,fj,maxit,tol)
  
[~,Afull1, b1, x01] = MatrizVigaBiEmpotrada(Nh1, L, fj);
[~,Afull2, b2, x02] = MatrizVigaBiEmpotrada(Nh2, L, fj);
[~,Afull3, b3, x03] = MatrizVigaBiEmpotrada(Nh3, L, fj);

[nuGC1,itGC1, rGC1] = GradienteConjugado(Afull1, b1, x01, maxit, tol);
[nuGC2,itGC2, rGC2] = GradienteConjugado(Afull2, b2, x02, maxit, tol);
[nuGC3,itGC3, rGC3] = GradienteConjugado(Afull3, b3, x03, maxit, tol);

x=linspace(0,L,Nh1+1);
y=[0 0 -nuGC1' 0 0];
plot(x,y)
hold on
grid
title("Grafica de desplazamientos")
xlabel('Eje X [metros]')
ylabel('Eje Y [metros]')
x=linspace(0,L,Nh2+1);
y=[0 0 -nuGC2' 0 0];
plot(x,y)
x=linspace(0,L,Nh3+1);
y=[0 0 -nuGC3' 0 0];
plot(x,y)
legend('Nh=10','Nh=25','Nh=50','location','north')
endfunction