function [vp, sigma, b] = householder(x, p) % Functie facuta in laboratorul 3.
m=size(x);
vp=zeros(m,1);
vp(1:p)=0;
if x(p)>0
	s=1;
else
	s=-1;
end
sigma=(-1)*s*sqrt(x(p:m)'*x(p:m));
vp(p)=x(p)+sigma;
for i=p+1:m
	vp(i)=x(i);
endfor
b = sigma*vp(p);
endfunction
