function [ Q R ] = HS(A) % Functiile ApplyHSToPColumn, ApplyHSToRColumn, householder sunt facute in laboratorul 3.
[m n]=size(A);
Q=zeros(m,n);
R=zeros(m,n);
H=eye(m);
for p=1:n-1
    x=A(:,p);
    [vp sigma beta]=householder(x,p);
    A(:,p)= ApplyHSToPColumn(x,p,sigma);
    H=(eye(m)-(2*vp*vp')/(vp'*vp))*H;
    for j=p+1:n
        A(:,j)= ApplyHSToRandomColumn(A(:,j),vp,p,beta);
    end
end
R=A;
Q=H';
endfunction
    
    
