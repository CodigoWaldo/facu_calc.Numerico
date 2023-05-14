#parcial ejercicio 2
#F = @(x) sin(x) + cos(1 + x.^2) -1;
#Fd = @(x) -2.*x.*sin(x.^2 + 1) +cos(x);

#x=linspace(7.8,7.9,500);

#plot(x,F(x),'r');
#hold on
#plot(x,Fd(x),'r');

#[PUNTO_X,rh_Ed,it_Ed,t_Ed] = NewtonRaphson(F,Fd,7.8,100,1.*10.^-8);

#PUNTO_X
#VALOR_MAX = F(PUNTO_X)


N=100;
A=[2 2 1 ; 1 1 1; 1 2 -2]
b=[7 2 5]'
maxit = 20000;
tol = 1e-8;
[L D U] = DescomponerMatriz(A);


disp("JACOBI:")
[xJ, r_hJ, itJ] = Jacobi(A,b,b,maxit,tol);

itJ % cantidad de iteraciones


disp("")
disp("GAUSS - SEIDEL:")
[xGS, r_hGS, itGS] = GaussSeidel(A,b,b,maxit,tol);
#r_eGS = Max(abs(eig(-inv(D*L)+U))) %Radio espectral
itGS % cantidad de iteraciones


disp("")
disp("SOR")

w= 1.1

[xSOR,r_hSOR,itSOR] = sor(A,b,b,maxit,tol,w);
#r_eGS = Max(abs(eig(-inv(D+w*L) * ((1-w)*D-w*U)))) %Radio espectral
itSOR % cantidad de iteraciones

disp("")
disp("GRADIENTE CONJUGADO:")
#[xGC,r_hGC,itGC] = GradienteConjugado(A,b,b,tol);
#itGC % cantidad de iteraciones



#GRAFICA DE CONVERGENCIA DE CADA MÉTODO
figure(1)
semilogy(r_hGS,'-b') #gauss seidel
grid on
grid minor
hold on
semilogy(r_hSOR,'-g') #sor
semilogy(r_hJ,'-r') #jacobi
#semilogy(r_hGC,'-y') #gradiendte conjugado
title('convergencia de cada método')
hold off

#GRÁFICA DE LA SOLUCION DEL SISTEMA
#z=linspace(0,1,N);
#figure(2)
#plot(z,xJm)

