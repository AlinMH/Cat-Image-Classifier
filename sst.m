function x=sst(A,b) % Algoritm din laboratorul 2 de rezolvare a sistemelor superior triunghiulare.
	[n n]=size(A);
	x=zeros(n,1);
	for i=n:-1:1
		sum1=sum(A(i,i+1:n)*x(i+1:n));
		x(i)=(b(i)-sum1)/A(i,i);
	endfor
endfunction

