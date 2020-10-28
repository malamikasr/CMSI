function [lambda1,X,A] = wielandt(A)
%%Implémentation de la méthode wielandt
%plus grand module
% return lambda : valeur propre de plus grand module
% return VecPropre : vecteur propre associé la valeur propre

%Fonction qui a vocation à être appelée plusiers fois pour avoir les
%différentes valeurs et vecteurs propres de A

[X,U,lambda1] = puissance_iteree(A);
A=A-lambda1*((X*U)/(U*X));