function hsolved = hitorisolve(h)
%Produces solution matrix for the given Hitori matrix
%   For the input Hitori matrix h, calculates the binary solution matrix
%   hsolved.

hsolved=ones(size(h))+1;

[m,n]=size(h);

for i=1:m
    for j=1:n
        val = h(i,j);
        hflag = zeros(m);
        vflag = zeros(n);
        
        % Check to see if unique in rows and columns
        if (sum(h(:,j)==val) == 1 && sum(h(i,:)==val) == 1)
            hsolved = circle(hsolved,i,j);
        end
        
        % Check if between 2 of the same
        if (1<i && i<m)
            if (h(i-1,j)==h(i+1,j))
                hsolved = circle(hsolved,i,j);
            end
        end
        if (1<j && j<n)
            if (h(i,j-1)==h(i,j+1))
                hsolved = circle(hsolved,i,j);
            end
        end
        
        % Flag rows with neighboring duplicates
        if (j < n)
            if (h(i,j) == h(i,j+1))
                hflag(i) = 1;
            end
        end
        if (i < m)
            if (h(i,j) == h(i+1,j))
                vflag(j) = 1;
            end
        end 
    end
end

for i=1:m
    for j=1:n
        if hflag(i)
            if ((h(i,j)!=h(i,j+1)) && j<n)
                hsolved = blacken(hsolved,i,j);
            end
            if ((h(i,j)!=h(i,j-1)) && j>1)
                hsolved = blacken(hsolved,i,j);
            end
        end
        if hflag(j)
            if ((h(i,j)!=h(i+1,j)) && i<m)
                hsolved = blacken(hsolved,i,j);
            end
            if ((h(i,j)!=h(i-1,j)) && i>1)
                hsolved = blacken(hsolved,i,j);
            end
        end
    end
end

% Check for double corners
switch(true)
    %Corner
    case (h(1,1)==h(1,2))
        hsolved = circle(hsolved,2,1);
    case (h(1,1)==h(2,1))
        hsolved = circle(hsolved,1,2);
    case (h(1,n-1)==h(1,n))
        hsolved = circle(hsolved,2,n);
    case (h(1,n)==h(2,n))
        hsolved = circle(hsolved,1,n-1);
    case(h(m,1)==h(m,2))
        hsolved = circle(hsolved,m-1,1);
    case(h(m,1)==h(m-1,1))
        hsolved = circle(hsolved,m,2);
    case(h(m-1,n)==h(m,n))
        hsolved = circle(hsolved,m-1,n);
    case(h(m,n)==h(m,n-1))
        hsolved = circle(hsolved,m-1,n);
    %Corner once removed
    case(h(2,1)==h(2,2))
        hsolved = circle(hsolved,1,2);
    case(h(1,2)==h(2,2))
        hsolved = circle(hsolved,2,1);
    case(h(2,n-1)==h(2,n))
        hsolved = circle(hsolved,1,n-1);
    case(h(1,n-1)==h(2,n-1))
        hsolved = circle(hsolved,2,n);
    case(h(m-1,1)==h(m-1,2))
        hsolved = circle(hsolved,m,2);
    case(h(m-1,2)==h(m,2))
        hsolved = circle(hsolved,m-1,1);
    case(h(m-1,n-1)==h(m-1,n))
        hsolved = circle(hsolved,m,n-1);
    case(h(m-1,n-1)==h(m-1,n))
        hsolved = circle(hsolved,m-1,n);
end
      

while (sum(sum(hsolved==2)))
    
end

end

