clc
clear
close all

h2 = [0.0427,  1];
h3 = [0.0959,  1];
h4 = [0.5619,  1];
h5 = [10.2618, 1];
h6 = [14.0419, 1];

figure(1);
bar(1:size(h2,2), [h2' h3' h4' h5' h6'].^.1);
set(gca, 'XTickLabel', {'a651', 'e87f'});

title('Time to Solve');
xlabel('Commit');
ylabel('Time (s)');
legend('2x2', '3x3', '4x4', '5x5', '6x6');
