clear
clc


h2 = [1 2; 2 2];
h3 = [1 2 1; 1 3 1; 3 1 3];
h4 = [4 2 2 4; 2 3 4 1; 4 1 2 3; 2 4 4 2];
h5 = [2 3 1 4 4; 1 5 4 3 5; 5 1 4 2 2; 3 4 1 5 2; 4 3 2 3 3];
h6 = [2 5 1 4 2 2; 5 4 2 3 6 1; 6 6 6 5 5 3; 4 3 1 5 5 6; 3 6 6 1 5 5; 5 1 5 1 3 4];
h7 = [2 4 1 1 2 5 5; 1 2 5 6 4 4 3; 6 7 2 4 5 2 5; 2 6 6 7 1 7 4; 7 1 6 5 6 3 2; 5 6 2 1 4 1 7; 4 4 1 2 6 7 1];


% run solver
% solve_hitori(h6); % solve


% run benchmarks
t2 = timeit(@() solve_hitori(h2))
t3 = timeit(@() solve_hitori(h3))
t4 = timeit(@() solve_hitori(h4))
t5 = timeit(@() solve_hitori(h5))
t6 = timeit(@() solve_hitori(h6))
t7 = timeit(@() solve_hitori(h7))
