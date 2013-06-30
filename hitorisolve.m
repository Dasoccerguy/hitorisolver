function hsolved = hitorisolve(h)
%Produces solution matrix for the given Hitori matrix
%   For the input Hitori matrix h, calculates the binary solution matrix
%   hsolved.

hsolved=ones(size(h))+1;

[m,n]=size(h);

for i=1:m
    for j=1:n
        val = h(i,j);
        if (sum(h(:,j)==val) == 1 && sum(h(i,:)==val) == 1)
            hsolved(i,j) = 1;
        end
        if (1<i && i<m)
            if (h(i-1,j)==h(i+1,j))
                hsolved(i,j) = 1;
            end
        end
        if (1<j && j<n)
            if (h(i,j-1)==h(i,j+1))
                hsolved(i,j) = 1;
            end
        end
    end
end

while (sum(sum(hsolved==2)))
    
end

end

