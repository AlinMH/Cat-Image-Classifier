function [x] = hsvHistogram(path,count)
	A=imread(path); % Generez matricea de pixeli
	[l c p]=size(A);
	H=zeros(l,c);
	S=zeros(l,c);
	V=zeros(l,c);
	R=double(A(:,:,1))/255; % Impart fiecare matrice la 255 pentru conversie.
	G=double(A(:,:,2))/255;
	B=double(A(:,:,3))/255;
	Cmax=zeros(l,c);
	Cmin=zeros(l,c);
	delta=zeros(l,c);
	Cmax=max(max(R,G),B); % Calculez maximele pe fiecare matrice, respectiv minimele.
	Cmin=min(min(R,G),B);
	delta=Cmax-Cmin;
	aux0=find(delta!=0); % Caut fiecare pozitie diferita de zero si le salvez intr-un auxiliar.
	aux2=find(Cmax==R); % Caut toate pozitiile in care valorile de pe pozitiile lui Cmax sunt egale cu valorile de pe pozitiile lui R.
	v1=intersect(aux2,aux0); % Intersectez pozitiile.
	H(v1)=60*(mod(double((G(v1)-B(v1))./delta(v1)),6)); % Modific valorile de pe pozitiile din v1.
	aux3=find(Cmax==G);	% Analog pentru G si B
	v2=intersect(aux3,aux0);
	H(v2)=60*(double((B(v2)-R(v2))./delta(v2)) + 2);
	aux4=find(Cmax==B);
	v3=intersect(aux4,aux0);
	H(v3)=60*(double((R(v3)-G(v3))./delta(v3)) + 4);
	aux5=find(Cmax!=0);
	S(aux5)=double(delta(aux5)./Cmax(aux5));
	V=Cmax;
	H=(H/360.00)*100.00;
	S=S*100.00;
	V=V*100.00;
	countaux=double(101.00/count); % countaux = numarul de valori din intervalul [0,100]
	for i=0:count-1 % calculez histograma la fel ca la RGB.
		hc(i+1)=length(H(H>=(i*countaux) & H<((i+1)*countaux)));
		sc(i+1)=length(S(S>=(i*countaux) & S<((i+1)*countaux)));
		vc(i+1)=length(V(V>=(i*countaux) & V<((i+1)*countaux)));
	endfor
	x=horzcat(hc,sc,vc);% concatenez fiecare histograma.
endfunction
