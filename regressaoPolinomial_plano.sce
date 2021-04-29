clc;
clear;

//base de dados
D =[122 139 0.115;
    114 126 0.120;
    086 090 0.105;
    134 144 0.090;
    146 163 0.100;
    107 136 0.120;
    068 061 0.105;
    117 062 0.080;
    071 041 0.100;
    098 120 0.115];

//Inicialização dos vetores das variáveis de entrada e saída
X1 = D(:,1);
X2 = D(:,2);
Y = D(:,3);

//Calculo dos coeficientes de regressão
X= ones (10,3);
i=1;
while i<=10
    X(i) = 1;
    X(10+i) = X1(i); 
    X(20+i) = X2(i);
    i=i+1;
end

//Vetor de coeficientes Beta
Beta = inv(((X.')*X)) * ((X.')*Y); //para lambda = 0.0, valor mínimo

//Plot dos gráficos
scatter3d(X1, X2, Y, 'red');
[X1,X2] = meshgrid(40:1:170,40:1:170);
yest = Beta(1) + Beta(2).*(X1) + Beta(3).*(X2);
mesh (X1, X2, yest);
//grid off;

//Variável de resposta
y_c = X*Beta;

//Metrica R2
R2 = 1 - sum((Y-y_c).^2)/sum((Y-mean(Y)).^2);
printf('R2 = %f\n', R2);
