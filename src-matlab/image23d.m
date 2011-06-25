%double matrix n x m image
%double angle between laser and camera in radians
%double distance between camera and axis
%double current angle of the object in radians
%int number of nodes for linear spline approximation

function X=image23d(A, Alpha, R, theta, N, tol)
A=im2double(A);
y=test1(A, 20, 7, N, tol);
Y=phiinv(y, max(size(A))*3);
X=test2(Y, Alpha, R, theta);