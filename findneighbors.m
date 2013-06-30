function neighbors = findneighbors(h, m, n)
    a = size(h, 1);
    
    % [up, right, down, left]
    neighbors = [[m-1, n]; [m, n+1]; [m+1, n]; [m, n-1]];
    
    % find invalid coordinates and remove them
    invalid = [];
    for i=1:4
        % if either coordinate is invalid
        if (neighbors(i,1)==0 || neighbors(i,2)==0 || neighbors(i,1)>a || neighbors(i,2)>a)
            invalid = [invalid, i];
        end
    end
    neighbors(invalid, :) = [];
end
