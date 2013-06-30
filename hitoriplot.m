function fH = hitoriplot(h)
%Plots a Hitori matrix
%   Plots the given Hitori matrix h in a new figure.

[m,n]=size(h);
center = get(0,'ScreenSize');
center=center(3:4)./2;
center(1)=center(1)-30*n;
center(2)=center(2)-30*m;

fH = figure;
set(fH,'Position',[center,60*n,60*m])
set(fH,'name','Hitori Plot')
%set(gca,'Position',[100,100,60*n,60*m])
set(0,'defaultaxesposition',[0 0 1 1])
set(gca,'xtick',[],'ytick',[])

for i=0:m
    hline = line([0,1],[-i/m,-i/m]);
    set(hline,'color','black')
end
for j=0:n
    vline = line([j/n,j/n],[0,-1]);
    set(vline,'color','black')
end

for k=1:2:2*m
    for l=1:2:2*n
        text((k/(2*m))-.005*(length(num2str(h((l+1)/2,(k+1)/2)))-1),-l/(2*n),num2str(h((l+1)/2,(k+1)/2)));
    end
end
end

