function r=evaluate(testset,w,hist_type,count)
	imgc=getImgNames(strcat(testset,'cats/')); % Analog ca in functia preprocess, generez o matrice cu histogramele imaginilor din cats si not_cats.
	[n m]=size(imgc);
	imgnc=getImgNames(strcat(testset,'not_cats/'));
	[p q]=size(imgnc);
	if(hist_type=='RGB')
		for i=1:n
			X(i,:)=rgbHistogram(strcat(strcat(testset,'cats/'),imgc(i,:)),count);
		endfor
		for j=n+1:n+p
			X(j,:)=rgbHistogram(strcat(strcat(testset,'not_cats/'),imgnc(j-n,:)),count);
		endfor
	endif
	if(hist_type=='HSV')
		for i=1:n
			X(i,:)=hsvHistogram(strcat(strcat(testset,'cats/'),imgc(i,:)),count);
		endfor
		for j=n+1:n+p
			X(j,:)=hsvHistogram(strcat(strcat(testset,'not_cats/'),imgnc(j-n,:)),count);
		endfor
	endif
	X(:,3*count+1)=1;
	aux1=w'*X(1:n,:)'; % Imi calculez raportul de numarul de imagini evaluate corect si numarul total de imagini din testset.
	aux2=w'*X(n+1:n+p,:)';
	r=((length(aux1(aux1>=0))+length(aux2(aux2<0)))/(n+p))*100;
endfunction
