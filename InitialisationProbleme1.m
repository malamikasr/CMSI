function [A , B , P] = InitialisationProbleme1()
%% Initialisation des matrices associées aux contraintes de la plaque
% La fonction renvoie les matrices A, B et P de notre problème.
    A = zeros(3200);
    B = zeros(3200,1);
    P = zeros(3200);
    
%% Initialisation de B
    for i = 1:size(B)
        if (mod(i,40) == 0 || mod(i,40) == 1)
            B(i) = 50;
        end
        if (i>=31*40 && i<=50*40)
            if (mod(i,40)==10 || mod(i,40)==30 || mod(i,40)==11 || mod(i,40)==31)
                B(i) = 50;
            end
        end
        if (i>=35*40 && i<=38*40)
            if (mod(i,40)>=21 && mod(i,40)<=25)
                B(i) = 150;
            end
        end
        if (i>=65*40 && i<=74*40)
            if (mod(i,40)>=4 && mod(i,40)<=14)
                B(i) = 150;
            end
        end
    end

%% Initialisation de A
    A(1,1) = 1;
    for j=2:1:3200
        if B(j)~=0
            A(j,j) = 1;
        elseif j>=2 && j<=39
            A(j,j-1) = 1;
            A(j,j+1)=1;
            A(j,j+40)=1;
            A(j,3200-40+j)=1;
            A(j,j)=-4;
        elseif j>=3162 && j<=3199
            A(j,j+1)=1;
            A(j,j-1)=1;
            A(j,j-40)=1;
            A(j,j-3160)=1;
            A(j,j)=-4;
        else
            A(j,j+1)=1;
            A(j,j-1)=1;
            A(j,j-40)=1;
            A(j,j+40)=1;
            A(j,j)=-4;

        end
    end

%% Initialisation de P
    for k=1:1:3200
        if k>=1 && k<=40 %La première colonne de l'objet 
            if k==40
                P(k,k-1)=1;
                P(k,k+40)=1;
                P(k,3200)=1;
                P(k,k)=-3;
            elseif k==1
                P(k,k+1)=1;
                P(k,k+40)=1;
                P(k,3200-40+k)=1;
                P(k,k)=-3;
            else 
                P(k,k-1)=1;
                P(k,k+1)=1;
                P(k,k+40)=1;
                P(k,3200-40+k)=1;
                P(k,k)=-4;
            end
        elseif k>=3161 && k<=3200 % Dernière colonne de l'objet
            if k==3161
                P(k,k-40)=1;
                P(k,k+1)=1;
                P(k,1)=1;
                P(k,k)=-3;
            elseif k==3200
                P(k,k-1)=1;
                P(k,k-40)=1;
                P(k,k-3160)=1;
                P(k,k)=-3;
            else 
                P(k,k+1)=1;
                P(k,k-1)=1;
                P(k,k-40)=1;
                P(k,k-3160)=1;
                P(k,k)=-4;
            end 
        elseif mod(k,40)==0 && k~=40 && k~=3200 %Dernière ligne de l'objet
            P(k,k)=-3;
            P(k,k-1)=1;
            P(k,k+40)=1;
            P(k,k-40)=1;
        elseif mod(k,40)==1 && k~=1 && k~=3161 %Première ligne de l'objet 
            P(k,k) = -3;
            P(k,k+1)=1;
            P(k,k+40)=1;
            P(k,k-40)=1;
        elseif k>31*40 && k<50*40 && ((mod(k,40)==10 || mod(k,40)==30) || (mod(k,40)==11 || mod(k,40)==31))  % Cas pour les oranges à l'intérieur
            if mod(k,40)==10 || mod(k,40)==30
                P(k,k-1)=1;
                P(k,k+40)=1;
                P(k,k-40)=1;
                P(k,k)=-3;
            elseif mod(k,40)==11 || mod(k,40)==31
                P(k,k+1)=1;
                P(k,k+40)=1;
                P(k,k-40)=1;
                P(k,k)=-3;
            end
        else
            P(k,k+1)=1;
            P(k,k-1)=1;
            P(k,k-40)=1;
            P(k,k+40)=1;
            P(k,k)=-4;
        end
    end
end

