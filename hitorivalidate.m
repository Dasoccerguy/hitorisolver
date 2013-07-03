function valid = hitorivalidate(h, hsolved)
    validbreadth = valid_breadthsearch(h, hsolved);
    
    valid = (validbreadth && true);
end



function valid = valid_breadthsearch(h, hsolved)
    valid = true;
    
    q = []
    n = 0;
    
    i = find(hsolved, 1); % index of first column non-zero
    
    % q first one
    q = [i];
    
    while (q)
        % get top node and remove from q
        node = q(1)
        q(1) = []
        
        % get neighbors and add them to q if not blacked
        neighbors = findneighbors_index(h, node)
        for i=neighbors
            if (hsolved(i) ~= 0)
                q = [q, i]
                n = n + 1;
            end
        end
    end
end
