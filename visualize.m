% visualize the velocity field
% 2018/07 Sujoy

% initial

nx = 120;
ny = 120;
nf = 2000;

%% load U

%from .dat
file = 'I:/PIV_OUT/PIV200/o-18u_1.dat';
U = reshape(loaddat(file,0,nx*ny*nf), [ny nx nf]);
U = permute(U, [2 1 3]);

% from .mat
filename = [''];
U = load(filename);

%% load V

file='I:/PIV_OUT/still/o-08v_1.dat';
V = reshape(loaddat(file,0,nx*ny*nf), [ny nx nf]);
V = permute(V, [2 1 3]);

% from .mat
filename = ['I:\PIV_OUT\still\mean\v/full\PIV_still_meanv_50.mat'];
load(filename);

%% visualize
% colormap jet
% one comp

%imagesc(fliplr(V(85:105,20:95,2000)))
%imagesc(fliplr(V(1:105,1:120,1400)))
x = [0 24];
y = [24 0];
imagesc(x, y, fliplr(Mean_Velocity(12:105,12:108)))
daspect([1 1 1])
%imagesc(x, y, slicedata, [0 intensity]);
    
    %axis equal;
    caxis([-1 0.3]);
    colorbar ('TickLabels', {'-1.0', '-0.5', '0.0', });
    %c = colorbar('eastoutside', 'Ticks', (0: intensity/4: intensity));
    %c.Label.String = 'Intensity';
    ax = gca;
    %ax.XAxisLocation = 'bottom';
    %ax.YAxisLocation = 'left';
    %ax.XColor = 'black';
    %ax.YColor = 'black';
    %ax.XScale = 'linear';
    %ax.YScale = 'linear';
    ax.YDir='normal';
    %ax.XLim = [-Lx/2 Lx/2];
    %ax.YLim = [-Ly/2 Ly/2];
    ax.XTickMode = 'manual';
    ax.YTickMode = 'manual';
    ax.XTick = 0:6:24;
    ax.YTick = 0:6:24;
    ax.TickDir = 'in';
    %    ax.TickLength = [0.02 0.035];
    %ax.XMinorTick = 'on';
    %ax.YMinorTick = 'on';
    %ax.XGrid = 'on';
    %ax.YGrid = 'on';
    %ax.GridColor = 'yellow';
    %ax.GridLineStyle = ':';
    %    ! '-'  ':'  '-.'  '--'
    ax.FontSize = 24;
    ax.FontName =  'Times New Roman';
    
%     ax.YTick=[]; % it is needed for without yaxis  
    
    %cpos = c.Position;
    %cpos(3) = 0.5*cpos(3);
    %c.Position = cpos;
    
    xlabel('\it \fontname{Times New Roman} y \rm[mm]');
    ylabel('\it \fontname{Times New Roman} x \rm[mm]');

% two comp

