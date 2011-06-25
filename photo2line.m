%Img: bild als matrix
%L: groesze des gauszfensters
%sigma: varianz des gauszfensters
%N: konten fuer stw. lineare approximation
%double tol zwischen 0 und 1 toleranz f�r erkennung er linie
%liefert eine punktmenge fuer eine vertikale linie

%auskommentierte zeilen sind wenn weichzeichner nur zeilenweise angewandt
%wird

function X=test1(Img, L, sigma, N, tol)
%gauss=gausswin(L, sigma);
%gauss=gauss./sum(gauss);
gauss=fspecial('gaussian', [L,L], sigma);
Img=conv2(Img, gauss, 'same');

Xtmp=zeros(size(Img,1),3);

for k=1:size(Img,1)
    %Img(i,:)=convn(Img(i,:), gauss, 'same');
    [maximum, index]=max(Img(k,:));
    Xtmp(k,1)=index-(size(Img,2)/2);
    Xtmp(k,2)=k-(size(Img,1)/2);
    
    if maximum>tol
        Xtmp(k,3)=1;
    else
        Xtmp(k,3)=0;
    end
end

%todo schaun ob das so passt oder ob man nochmal glätten muss
X=zeros(N,3);

for k=1:N
    X(k,:)=Xtmp(floor((size(Img,1)/N))*k,:);
end


