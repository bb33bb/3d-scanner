%x,y punkte auf der ebene auf die projeziert wird
%c abstand der ebene auf den punkt durch den projeziert wird

function alpha=phiinv(X,C)
alpha(:,1)=asin(X(:,1)/C);
alpha(:,2)=asin(X(:,2)/C);
alpha(:,3)=X(:,3);
