function [X t]=preprocess(directory,hist_type,count)
	imgc=getImgNames(strcat(directory,'cats/')); % Folosesc functia getImgNames pentru a obtine matricea de nume a imaginilor.
	[n m]=size(imgc);
	imgnc=getImgNames(strcat(directory,'not_cats/'));
	[p q]=size(imgnc);
	if(hist_type=='RGB')
		for i=1:n
			X(i,:)=rgbHistogram(strcat(strcat(directory,'cats/'),imgc(i,:)),count); % Fac histograma pentru fiecare imagine din fisierul cats, respectin not_cats.
		endfor
		for j=n+1:n+p
			X(j,:)=rgbHistogram(strcat(strcat(directory,'not_cats/'),imgnc(j-n,:)),count);
		endfor
	endif
	if(hist_type=='HSV')
		for i=1:n
			X(i,:)=hsvHistogram(strcat(strcat(directory,'cats/'),imgc(i,:)),count); % Analog pentru hsv.
		endfor
		for j=n+1:n+p
			X(j,:)=hsvHistogram(strcat(strcat(directory,'not_cats/'),imgnc(j-n,:)),count);
		endfor
	endif
	t(1:n)=1; % Generez vectorul de etichete.
	t(n+1:n+p)=-1;
	t=t';
endfunction