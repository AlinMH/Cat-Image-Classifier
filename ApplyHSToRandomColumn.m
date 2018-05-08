function x = ApplyHSToRandomColumn(x, vp, p, b) % Functie facuta in laboratorul 3.
	m = length(x);
	tau = sum(vp(p:m) .* x(p:m))/b;
	x(p:m) = x(p:m) - tau * vp(p:m);
endfunction