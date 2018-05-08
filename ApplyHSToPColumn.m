function x = ApplyHSToPColumn(x, p) % Functie facuta in laboratorul 3.
	[vp, sigma, b] = householder(x, p);
	x(p) = -sigma;
	x(p + 1 : length(x)) = 0;
endfunction