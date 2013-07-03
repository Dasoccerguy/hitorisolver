function rows = find_row(p_row, m, current_row, h, solution)
    n = size(p_row, 2);
    current_row = current_row + 1;
    
    permutations = [0];
    
    q = [1];
    while ~isempty(q)
        current = q(1);
        q(1) = [];
        
        if current*2 < 2^n
            if mod(current, 2) ~= 0
                q = [q current*2];
            else
                q = [q current*2 current*2+1];
            end
        end
        
        permutations = [permutations current];
    end
    
    rows = filter_permutations(p_row, permutations);
    rows = validate_numbers_rows(rows, h, current_row);
    
    if current_row < m
        for i=1:size(rows, 1)
            solution = [solution; rows(i, :)]
            find_row(rows(i, :), m, current_row, h, solution);
            solution(end, :) = [];
        end
    else
        for i=1:size(rows, 1)
            solution = [solution; rows(i, :)];
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
