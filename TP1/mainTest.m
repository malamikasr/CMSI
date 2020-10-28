
% test Resolution equation A*X = B
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

A3 = ones(3000,3000);
%% Test 1 : convergence

conv1 = convergence(A1);
conv2 = convergence(A2);
conv3 = convergence(A3);

assert(conv1==1);
assert(conv2==1);
assert(conv3==0);

%% Test 2 : Jacobi

[X1,~] = jacobi(A1,B1,epsilon);
[X2,~] = jacobi(A2,B2,epsilon);

assert(max(A1*X1-B1<=epsilon));
assert(max(A2*X2-B2<=epsilon));

%% Test 3 : Gauss
[X1,~] = gauss(A1,B1,epsilon);
[X2,~] = gauss(A2,B2,epsilon);

assert(max(A1*X1-B1<=epsilon));
assert(max(A2*X2-B2<=epsilon));

%% Test 4 : Relaxation

[X1,~] = relaxation(A1,B1,epsilon);
[X2,~] = relaxation(A2,B2,epsilon);

assert(max(A1*X1-B1<=epsilon));
assert(max(A2*X2-B2<=epsilon));
