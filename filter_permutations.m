function ok_permutations = filter_permutations(p_row, permutations)
    n = size(p_row, 2);
    ok_permutations = [];
    
    for permutation = permutations
        bin_permutation = decimalToBinaryVector(permutation, n);
        test_permutation = ~(bin_permutation & p_row);
        
        if sum(test_permutation == 0) == 0
            ok_permutations = [ok_permutations; bin_permutation];
        end
    end
    
    ok_permutations = unique(ok_permutations, 'rows');
end
