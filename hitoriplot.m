function fH = hitoriplot(h, hsolved)
    % plots the given problem and fills in the solution
    
    close all;
    fH = figure;
    
    [m, n] = size(h);
    
    for a=0:m-1
        for b=0:n-1
            number = h(b+1, a+1);
            state = hsolved(b+1, a+1);
            y = n-1-b; % correct y-coordinate compensates for axis indexing
            
            if (state == 1)
                color = [.5 .5 .5];
            else
                color = [1 1 1];
            end
            
            rectangle('Position', [a,y,1,1], 'FaceColor', color);
            if (state == 0)
                rectangle('Position', [a+.25,y+.25,.5,.5], 'Curvature', [1,1], 'FaceColor', color);
            end
            
            text(a+.5, y+.5, num2str(number));
        end
    end
end
