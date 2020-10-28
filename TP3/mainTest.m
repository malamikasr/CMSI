% Test des méthodes pour trouver les valeurs propres et les vecteurs
% propress : 

%Création de matrices aléatoires :
A1 = 300*rand(20,20);
A2 = 200*rand(50,50);
A3 = 500*rand(100,100);
epsilon = 0.02;

%% Test 1 : Puissance itérée valeur propres

[X1,~,lambda1] = puissance_iteree(A1);
[X2,~,lambda2] = puissance_iteree(A2);
[X3,~,lambda3] = puissance_iteree(A3);

assert(max(A1*X1 -lambda1*X1) <= epsilon);
assert(max(A2*X2 - lambda2*X2) <= epsilon);
assert(max(A3*X3 - lambda3*X3) <= epsilon);
%{
%% Test 2 : Wielandt : 
[lambda1, VecPropre1] = wielandt(A1);
[lambda2, VecPropre2] = wielandt(A2);
[lambda3, VecPropre3] = wielandt(A3);

for i=1:1:length(A1)
    assert(max(A1*VecPropre(:,1) - lambda1(i)*VecPropre(:,1)) <=epsilon);
end

for j=1:1:length(A2)
    assert(max(A2*VecPropre2(:,1) - lambda2(j)*VecPropre2(:,1)) <= epsilon);
end

for k=1:1:length(A3)
    assert(max(A3*VecPropre3(:,1) - lambda3(k)*VecPropre3(:,1)) <= epsilon);
end
%}