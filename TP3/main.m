A = zeros(800);

for i=1:1:800
       if (i>=1 && i<=20) || i>=781 || (i>=185 && i<=187) || (i>=205 && i<=207) || (i>=225 && i<=227) || (i>=401 && (mod(i,20)==1 || mod(i,20)==0))
           A(i,i)=1;
       
       elseif i>=21 && (mod(i,20)==1 || mod(i,20)==0)
           if mod(i,20)==1
               A(i,i+1)=1;
               A(i,i-20)=1;
               A(i,i+20)=1;
               A(i,i)=-3;
           else
               A(i,i-1)=1;
               A(i,i-20)=1;
               A(i,i+20)=1;
               A(i,i)=-3;
           end      
       else
        A(i,i+1)=1;
        A(i,i-1)=1;
        A(i,i-20)=1;
        A(i,i+20)=1;
        A(i,i)=-4;
       end 
end
B = inv(A);
str = ones(20, 40, 90);
for j=1:1:70
    [lambda, VecPropr,Bnv] = wielandt(B);
    B = Bnv;
    T = reshape(VecPropr, 20,40);
    str(:,:,j) = T;
end 
for h=71:1:91
    [lambda, VecPropr, Anv] = wielandt(A);
    A =  Anv;
    V = reshape(VecPropr, 20,40);
    str(:,:,h) = V;
end 

for l=1:1:91
    tempInstant = str(:,:,l);
    surf(tempInstant);
    pause(.1);
end