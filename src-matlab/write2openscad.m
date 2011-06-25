function write2openscad(file, matrix)
fprintf(file, 'polyhedron(points=[');
[N,M,wurscht]=size(matrix);
for n=1:N
    for m=1:M
        fprintf(file, '[ %.5f ,', matrix(n,m,1));
        fprintf(file, '%.5f ,', matrix(n,m,2));
        if(m==M && n==N)
            fprintf(file, '%.5f ]', matrix(n,m,3));
        else
            fprintf(file, '%.5f ],', matrix(n,m,3));
        end
    end
end
fprintf(file, '], triangles=[');
%todo: -1 entfernen (abfrage ob element existiert out of bounds)
for n=1:N-1%new -1
    for m=1:M-1%new -1 
        %new
        if (matrix(n,m,4)==1 && matrix(n,m+1,4)==1 && matrix(n+1,m+1,4)==1 && matrix(n+1,m,4)==1)
            %not new
        fprintf(file, '[ %d , %d , %d ],',  (n-1)*M+m-1, (n-1)*M+m, mod(n,N)*M+m); 
        if(m==M && n==N)
            fprintf(file, '[ %d , %d , %d ]',  (n-1)*M+m-1, mod(n,N)*M+m, mod(n,N)*M+m-1);
        else
            fprintf(file, '[ %d , %d , %d ],',  (n-1)*M+m-1, mod(n,N)*M+m, mod(n,N)*M+m-1);
        end
        %new
        end
        %not new
    end
end
fprintf(file, ']);');