function neighbors = findneighbors_index(h, i)
    % convert index to coordinates
    dim = size(h, 1);
    n = ceil(i / dim);
    
    m = mod(i, dim);
    if m == 0
        m = m + dim;
    end
    
    neighbors = findneighbors(h, m, n);
    
    % convert coordinates to indicies
    vector = [];
    for i=1:size(neighbors, 1)
        value = neighbors(i,1) + (neighbors(i,2)-1)*dim;
        vector = [vector, value];
    end
    neighbors = vector;
end
