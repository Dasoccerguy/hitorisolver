function solve_hitori(h)
    seed_row = zeros(1, size(h, 2));
    find_row(seed_row, 0, h, []);
end
