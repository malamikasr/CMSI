function [x,iter] = gauss(A,B,epsilon)
%% Implémentation de la méthode de Gauss
%Renvoie le vecteur x solution de l'equation A*X = B avec epsilon un
%facteur de précision
%Renvoie le nombre d'itération nécessaires afin de trouver la convergence

%% Initialisation des variables
x = ones(size(B));
L = tril(A);
M = diag(A) + L;
U = triu(A)-M;
L = A-triu(A);
N =-L-U;
iter = 0;

%% Boucle tant que la précision souhaitée n'est pas atteinte on itère

while max(abs(A*x - B))>epsilon
    iter = iter + 1;
    for i=1:1:length(A)
            
         somme1=0;
         if i>1
            for j=1:1:i-1
                somme1 = somme1+A(i,j)*x(j);
            end
         end 
         
         somme2 = 0;
         for h=i+1:1:length(A)
                 somme2 = somme2 + A(i,h)*x(h);
         end 
         
         x(i) = (1/A(i,i))*(B(i) - somme1 - somme2);
         
    end   
end
    
end