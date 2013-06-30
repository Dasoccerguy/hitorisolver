function fH = hitoriplotmarkup(fH,hsolved)
%Graphically changes the given Hitori plot to show the solution
%   Given the plot fH and the solution matrix hsolved, either circles or
%   fills in all sections of the grid

[m,n]=size(hsolved);
fH=figure(fH);

for i=1:m
    for j=1:n
        if hsolved(i,j)
            hcircle(i,j,m,n);
        else
            hfill(i,j,m,n);
        end
    end
end
soundsc('qwertyuiop')
end

function hcircle(y,x,m,n)
%Circles the given coordinate in fH
%   Given the coordinates x and y, plots an ellipse around
%   that location

x = ((2*x-1)/(2*n))-(1/(3*n));
y = -((2*y-1)/(2*m))-(1/(3*m));
rectangle('Curvature',[1,1],'Position',[x,y,1/(1.5*n),1/(1.5*m)])
end

function hfill(y,x,m,n)
%Fills the given cell in fH
%   Given the coordinates x and y, plots a dark rectangle on that location

x = (x-1)/n;
y = -y/n;
r=rectangle('Position',[x,y,1/n,1/m]);
set(r,'Facecolor',[.33,.33,.33])
end