function valid = no_islands(solution)
    q = [];
    
    visited = [];
    
    i = find(solution==0, 1, 'first'); % index of first column zero
    
    % q first one
    q = [i];
    
    while ~isempty(q)
        % get top node and remove from q
        node = q(1);
        q(1) = [];
        
        % add node to visited
        visited = [visited node];
        
        % get neighbors and add them to q if not blacked
        neighbors = findneighbors_index(solution, node);
        
        for i=neighbors
            if solution(i) == 0 && ~any(visited == i) && ~any(q == i)
                q = [q, i];
            end
        end
    end
    
    if size(visited, 2) == sum(sum(solution == 0))
        valid = true;
    else
        valid = false;
    end
end
