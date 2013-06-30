function hsolved = blacken(hsolved,m,n)
%Given hsolved, blacks out provided coordinate and circles its neighbors
%   Uses findneighbors to choose coordinates to circle

neighbors = findneighbors(hsolved,m,n);
hsolved(m,n) = 0;
for i=1:size(neigbors,1)
    hsolved = circle(hsolved, neighbors(i,1),neighbors(i,2));
end
end

