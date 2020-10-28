%% Problème 1
%% Initialisation des matrices

[A1 , B1 , P1] = InitialisationProbleme1();

%% Calcul de la solution x1

eps = 0.2;
[x1,iter1] = relaxation(A1,B1,eps); %Méthode relaxation du TP1

%% Affichage dynamique de la variation de température

MatriceResultat = zeros(3200,1);

f1 = figure('Name', 'Température');

for i=1:1:50
    T1 = expm(P1*i*4)*x1;
    MatriceResultat(:,:,i) = T1;
end

for i=1:1:50
    T1 = reshape(MatriceResultat(:,:,i),40,80);
    surf(T1);
    title('Représentation 3D de la variation de la température sur la plaque');
    zlabel('Température en degré celsius');
    axis([0 80 0 40 0 150]);
    pause(1.0);
end

%% Problème 2
%% Initialisation des matrices

[A2,X2] = InitialisationProbleme2();

%% Evolution de la température : 

MatriceResultat = zeros(3200,1);

for t=1:1:50
    X2 = expm(A2*t*4)*X2;
    MatriceResultat(:,:,t) = X2;
end

for t=1:1:50
    T2=reshape(MatriceResultat(:,:,t),40,80);
    surf(T2);
    title('Représentation 3D de la variation de la température sur la plaque');
    zlabel('Température en degré celsius');
    axis([0 80 0 40 0 150]);
    pause(1.0);
    if mod(t,5)==0 %Toutes les 5 itérations on remet le chauffage
        for i = 1:size(X2)
            if (i>=35*40 && i<=38*40)
                if (mod(i,40)>=21 && mod(i,40)<=25)
                    X2(i) = 150;
                end
            end
            if (i>=65*40 && i<=74*40)
                if (mod(i,40)>=4 && mod(i,40)<=14)
                    X2(i) = 150;
                end
            end
        end
    end
end

