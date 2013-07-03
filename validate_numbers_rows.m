function valid_rows = validate_numbers_rows(rows, h, current_row)
    h_row = h(current_row, :);
    valid_rows = [];
    
    for i = 1:size(rows, 1)
        permutation = rows(i, :);
        blacked_out_row = h_row.*(~permutation);
        
        blacked_out_row(blacked_out_row==0) = []; % remove zeros
        if size(blacked_out_row, 2) == size(unique(blacked_out_row), 2)
            valid_rows = [valid_rows; permutation];
        end
    end
end
