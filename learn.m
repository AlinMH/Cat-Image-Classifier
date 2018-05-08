function w=learn(X,t)
	[n m]=size(X);
	w=zeros(m+1,1); %Initializez vectorul w cu lungimea 3*count_bins + 1.
	X(:,m+1)=1; % Initializez X tilda.
	A=X'*X; % Din formula initiala din enuntul temei,inmultesc cu (X'*X) la dreapta si o factorizez Q R cu Householder si inmultesc la dreapta cu Q'.
	[Q R]=HS(A); % Imi ramane de rezolvat un sistem superior triungiular R*w=A*b (A=X'*X b=Q'*X'*t)
	b=Q'*X'*t;
	w=sst(R,b); % Folosesc algoritmul de la laboratorul 2 de rezolvare a sistemelor superior triunghiulare.
endfunction