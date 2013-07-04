function valid = no_islands(solution)
    q = [];
    visited = [];
    
    % first element in q
    i = find(solution==0, 1, 'first'); % index of first column zero
    q = [i];
    
    while ~isempty(q)
        % get top node and remove from q
        node = q(1);
        q(1) = [];
        
        % add node to visited
        visited = [visited node];
        
        % get neighbors and add them to q if not blacked, visited, or in q
        neighbors = findneighbors_index(solution, node);
        for i=neighbors
            if solution(i) == 0 && ~any(visited == i) && ~any(q == i)
                q = [q, i];
            end
        end
    end
    
    % solution has no islands if we were able to visit all 0's in the solution
    if size(visited, 2) == sum(sum(solution == 0))
        valid = true;
    else
        valid = false;
    end
end
