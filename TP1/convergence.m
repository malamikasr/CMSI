function conv = convergence(A)
%% Fonction qui teste la convergence 
%Renvoie 0 si ne converge pas
%Renvoie 1 si ça converge


conv  = 1;

%% Test si la matrice est inversible 
if(det(A)==0)
    conv = 0;

%% Test si A est à diagonale strictement dominante
for k=1:1:length(A)
    somme=0;
    for i=1:1:length(A)
        if i~=k
            somme = somme + A(k,i);
        end
    end
    
    if abs(A(k,k)) <= abs(somme)
        conv = 0;
    end
end

  
end