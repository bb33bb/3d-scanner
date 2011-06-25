%X=
%string bildprefix
%string bildpostfix
%int index of first image
%int digits of image number
%double angle of camera and laser in radiants
%double distance of camera and axis
%int vsteps
%int hsteps
%double tol between 0 and 1 tolerance for line detection

function X=points3d(bildprefix, bildpostfix, bildint, digits, Alpha, R, vsteps, hsteps, tol)
currentimage=0;
for i=1:vsteps
 fprintf('#');
currentimage=int2str(bildint+i);
[wurscht, length]=size(currentimage);
while(length<digits)
    [wurscht, length]=size(currentimage);
    currentimage=strcat('0', currentimage);
end

bildfilename=strcat(bildprefix, currentimage, bildpostfix);

A=imread(bildfilename);
A=im2double(A(:,:,1));


X(i,:,:)=image23d(A, 2*pi/3, 15, (i*pi*2)/vsteps, hsteps, tol);
end
fprintf('\n');