function [A,X] = InitialisationProbleme2()
%% Initialisation des matrices associées aux contraintes de la plaque
% La fonction renvoie les matrices A et X de notre problème.
    A = zeros(3200);
    X=zeros(3200,1);
%% Remplissage de X
    for i = 1:size(X)
        if (i>=35*40 && i<=38*40)
            if (mod(i,40)>=21 && mod(i,40)<=25)
                X(i) = 150;
            end
        end
        if (i>=65*40 && i<=74*40)
            if (mod(i,40)>=4 && mod(i,40)<=14)
            X(i) = 150;
            end
        end
    end
%% Remplissage A : 
    for k=1:1:3200
        if k>=1 && k<=40 %La première colonne de l'objet 
            if k==40
                A(k,k-1)=1;
                A(k,k+40)=1;
                A(k,3200)=1;
                A(k,k)=-3;
            elseif k==1
                A(k,k+1)=1;
                A(k,k+40)=1;
                A(k,3200-40+k)=1;
                A(k,k)=-3;
            else 
                A(k,k-1)=1;
                A(k,k+1)=1;
                A(k,k+40)=1;
                A(k,3200-40+k)=1;
                A(k,k)=-4;
            end
        elseif k>=3161 && k<=3200  % Dernière colonne de l'objet
            if k==3161
                A(k,k-40)=1;
                A(k,k+1)=1;
                A(k,1)=1;
                A(k,k)=-3;
            elseif k==3200
                A(k,k-1)=1;
                A(k,k-40)=1;
                A(k,k-3160)=1;
                A(k,k)=-3;
            else 
                A(k,k+1)=1;
                A(k,k-1)=1;
                A(k,k-40)=1;
                A(k,k-3160)=1;
                A(k,k)=-4;
            end 
        elseif mod(k,40)==0 && k~=40 && k~=3200 %Dernière ligne de l'objet
            A(k,k)=-3;
            A(k,k-1)=1;
            A(k,k+40)=1;
            A(k,k-40)=1;
        elseif mod(k,40)==1 && k~=1 && k~=3161 %Première ligne de l'objet 
            A(k,k) = -3;
            A(k,k+1)=1;
            A(k,k+40)=1;
            A(k,k-40)=1;
        elseif (k>31*40 && k<50*40)  && (mod(k,40)==10 || mod(k,40)==30 || mod(k,40)==11 || mod(k,40)==31) % Cas pour les oranges à l'intérieur
            if mod(k,40)==10 || mod(k,40)==30 
                A(k,k-1)=1;
                A(k,k+40)=1;
                A(k,k-40)=1;
                A(k,k)=-3;
            elseif mod(k,40)==11 || mod(k,40)==31
                A(k,k+1)=1;
                A(k,k+40)=1;
                A(k,k-40)=1;
                A(k,k)=-3;
            end
        else
            A(k,k+1)=1;
            A(k,k-1)=1;
            A(k,k-40)=1;
            A(k,k+40)=1;
            A(k,k)=-4;
        end
    end

end

