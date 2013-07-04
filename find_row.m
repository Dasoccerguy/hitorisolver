function rows = find_row(p_row, current_row, h, solution)
    m = size(h, 1);
    n = size(p_row, 2);
    current_row = current_row + 1;
    
    % a blank row is always valid
    permutations = [0];
    
    q = [1];
    while ~isempty(q)
        % get the first pattern off of q
        current = q(1);
        q(1) = [];
        
        % generate other possible patterns and put into q
        if current*2 < 2^n
            if mod(current, 2) ~= 0
                q = [q current*2];
            else
                q = [q current*2 current*2+1];
            end
        end
        
        % add this permutation to q
        permutations = [permutations current];
    end
    
    % filter permutations against previous row and row numbers
    rows = filter_permutations(p_row, permutations);
    rows = validate_numbers_rows(rows, h, current_row);
    
    % if we're not in the last row yet
    if current_row < m
        % add the rows one at a time to the solution and recurse
        for i=1:size(rows, 1)
            solution = [solution; rows(i, :)]
            find_row(rows(i, :), current_row, h, solution);
            solution(end, :) = [];
        end
        
    % last row, so let's check our solutions
    else
        % add each final row to the solution
        for i=1:size(rows, 1)
            solution = [solution; rows(i, :)];
            
            % check for valid column numbers, then for no islands
            if validate_numbers_columns(h, solution)
                if no_islands(solution)
                    'final solution:'
                    solution
                    hitoriplot(h, solution);

                    err = MException('ResultChk:BadInput', 'you are done!');
                    throw(err);
                end
            else
                solution(end, :) = [];
            end
        end
    end
end
