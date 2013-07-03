function valid = validate_numbers_columns(h, solution)
    valid = true;
    
    for i=1:size(h, 2)
        column = solution(:, i);
        blacked_out_column = h(:, i).*(~column);
        
        blacked_out_column(blacked_out_column==0) = []; % remove zeros
        if size(blacked_out_column, 1) ~= size(unique(blacked_out_column), 1)
            valid = false;
        end
    end
end
