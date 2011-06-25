%X: raumwinkel der punke von der kamera aus gesehen
%Alpha: winkel den die ebenen der kamera und des lasers einschlie�en
%R: abstand von kamera zu drehachse
%phi: winkel in dem die plattform gerade zur kamera steht

function schnitt=test2(X, Alpha, R, phi)
%stelle matrix auf um lgs zu loesen um koordinaten des punktes auf der
%schnittebene zu finden
    s=sin(Alpha);
    c=cos(Alpha);
    A=[s, 0; c, 0];
    schnitt=zeros(size(X,1), 4);
    for n=1:size(X,1)
        A(1,2)=-sin(X(n,1));
        A(2,2)=cos(X(n,1));
        tmp=A\[0;R];
        schnitt(n,:)=[cos(phi)*tmp(1); sin(phi)*tmp(1); -tmp(2)*sin(X(n,2)); X(n,3)];        
    end
