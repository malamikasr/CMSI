function [X,U,lambda1] = puissance_iteree(A)
%%Implémentation de la méthode de la puissance itérée : 
% return lamnbda1 la valeur propre de plus grand module
%X vecteur propre associé à lambda1
% U vecteur propre (la transposée  de x en terme de matrice)

[n m]=size(A);
X=ones(n,1);
Y=ones(n,1);
lambda1=1;
lambda2=1;
U=X';
precision=0.02;
while max(abs(A*X-lambda1*X))>precision 
    Y=A*X;
   lambda1=norm(Y)/norm(X); %Norm(X) non nulle car initialisé avec des 1
   if dot(X,Y)<0
        lambda1= -lambda1;
   end
   X=Y/norm(Y); %Norm(Y) non nulle puisque A et X !=0
end

while max(abs(U*A-lambda2*U))>precision 
   Y=U*A;
   lambda2=norm(Y)/norm(U); %Norm(U) non nulle car initialisé avec des 1
   if dot(U,Y)<0
        lambda2=-lambda2;
   end
   U= Y/norm(Y); %Norm(Y) non nulle puisque A et U !=0
end
end