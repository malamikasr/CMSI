function [X,iter] = relaxation(A, B, epsilon)
%% Implémentation de la méthode de Relaxation
%Renvoie le vecteur x solution de l'equation A*X = B avec epsilon un
%facteur de précision
%Renvoie le nombre d'itération nécessaires afin de trouver la convergence 

%% Initialisation des variables
   [n, ~] = size(A);
   X = ones(n, 1);
   D = diag(diag(A));
   L = tril(A, -1);
   U = triu(A, 1);
   w = 0.1;
   rayspec = 10000;
   iter = 0;
   
%% Boucle permettant de trouver le w optimal : 
   for i = 0.01:0.5:1.99
       pi = (D + i*L)\((1-i)*D - i*U);
       rayspec1 = max(abs(eig(pi)));
       if(rayspec1 < rayspec)
           w = i;
           rayspec = rayspec1;
           pimin = pi;
       end
   end
   beta = (D + w * L)\(w*B);
   
%% Boucle tant que la précision souhaitée n'est pas atteinte on itère : 
   while max(abs(A * X - B)) > epsilon
       X = pimin * X +beta;
       iter = iter + 1;
   end
end