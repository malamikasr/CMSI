function [x,iter] = jacobi(A,B,epsilon)
%%Implémentation de la méthode de jacobi
%Renvoie le vecteur x solution de l'equation A*X = B avec epsilon un
%facteur de précision
%Renvoie le nombre d'itération nécessaires afin de trouver la convergence

%% Initialisation des variables
x = ones(size(B));
M = diag(diag(A));
L = tril(A)-M;
U = triu(A)-M;
L = A-triu(A);
N =-L-U;
iter=0;

%% Boucle tant que la précision souaitée n'est pas atteinte on itère 

while max(abs(A*x-B))>epsilon  
    iter = iter + 1;
    for i=1:1:length(A)
        somme=0;
         for j=1:1:length(A)
             if j ~=i
                 somme = somme+A(i,j)*x(j);
             end
         end
         
          x(i) = (1/A(i,i))*(B(i) - somme);
    end
   
end
    
end