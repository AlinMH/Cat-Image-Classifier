function [x] =rgbHistogram(path,count)

A=imread(path); %generez matricea de pixeli
R=A(:,:,1); % R-matricea RED B-matricea BLUE si G-matricea GREEN
G=A(:,:,2);
B=A(:,:,3);
for i=0:count-1 % Vectorizez fiecare histograma rl,gl,bl si numar cati pixeli am din intervalul de interes.
	rl(i+1)=length(R((R>=i*(256/count)) & (R<((i+1)*(256/count)))));
	gl(i+1)=length(G((G>=i*(256/count)) & (G<((i+1)*(256/count)))));
	bl(i+1)=length(B((B>=i*(256/count)) & (B<((i+1)*(256/count)))));
endfor
x=horzcat(rl,gl,bl); % Concatenez fiecare histograma.
endfunction
