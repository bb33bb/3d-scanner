%filebuffer file to write open scad output to
%double matrix n x m x 3 of coordinates of n colums m rows of 3 dimensonal
%points of output

function write2openscad2(file, matrix)
fprintf(file, 'polyhedron(points=[');
[N,M,wurscht]=size(matrix); % N spalten M zeilen
for n=1:N
    for m=1:M
        fprintf(file, '[ %.5f ,', matrix(n,m,1));
        fprintf(file, '%.5f ,', matrix(n,m,2));
        if(m==M & n==N)
            fprintf(file, '%.5f ]', matrix(n,m,3));
        else
            fprintf(file, '%.5f ],', matrix(n,m,3));
        end
    end
end
fprintf(file, '], triangles=[');
for n=0:N-1
    for m=0:M-2 %hier irgendwo ist die schleife zu weit gelaufen und hat open scad gekillt (dreiecke mit punkten die es nicht gibt)
        fprintf(file, '[ %d , %d , %d ],', M*n+m, M*mod((n+1),N)+m,  M*n+m+1);
        if(m==M-2 & n==N-1)
            fprintf(file, '[ %d , %d , %d ]',  M*n+m+1, M*mod(n+1,N)+m,  M*mod(n+1,N)+m+1);
        else
            fprintf(file, '[ %d , %d , %d ],',  M*n+m+1, M*mod(n+1,N)+m,  M*mod(n+1,N)+m+1);
        end
    end
end
fprintf(file, ']);');