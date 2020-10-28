%% Initialisation des matrices pour les tests : 


epsilon = 0.01; % Precision
W = 100*rand(1,3000);
for j=1:1:3000
    if W(j)==0
        W(j)=1;
    end
end 

A1 = diag(W); %Créer une matrice diagonale avec les valeurs de la diagonale de w sans valeur nulle 
B1 = randn(3000,1);


v=ones(1,100);
v = 200.*v;
A2 = diag(v);

for i=1:1:100 %Créer une matrice à diagonale dominante
     for j=1:1:100
        if i~=j
            A2(i,j)=1;
        end 
    end
end 
B2 = randn(100,1);

%% Lancement des tests unitaires : 
result = runtests('mainTest'); 
rt = table(result); 

%% Comparaison des performances : 
[~,iter1]  = jacobi(A1,B1,epsilon);
[~,iter2]  = jacobi(A2,B2,epsilon);

[~,iter3] = gauss(A1,B1,epsilon);
[~,iter4] = gauss(A2,B2,epsilon);

[~,iter5] = relaxation(A1,B1,epsilon);
[~,iter6] = relaxation(A2,B2,epsilon);

%% Affichage du nombre d'itération pour chaque méthode :
disp(['Nombre d itération pour la méthode de jacobi : ' num2str(iter1) ' ' num2str(iter2)])
disp(['Nombre d itération pour la méthode de gauss : ' num2str(iter3) ' ' num2str(iter4)])
disp(['Nombre d itération pour la méthode de relaxation : ' num2str(iter5) ' ' num2str(iter6)])
