% visualize the velocity field
% 2018/07 Sujoy

% initial

nx = 120;
ny = 120;
nf = 2000;

%% load U

%from .dat
file = 'I:/PIV_OUT/still/o-08u_1.dat';
U = reshape(loaddat(file,0,nx*ny*nf), [ny nx nf]);
U = permute(U, [2 1 3]);

% from .mat
filename = [''];
U = load(filename);

%% load V

file='I:/PIV_OUT/still/o-01v_1.dat';
V = reshape(loaddat(file,0,nx*ny*nf), [ny nx nf]);
V = permute(V, [2 1 3]);

% from .mat
filename = ['G:\PIV_OUT\still\mean\full/PIV_still_meanv_50.mat'];
load(filename);

%% visualize
% colormap jet
% one comp

%imagesc(fliplr(V(1:105,:,2)))
%imagesc(fliplr(V(50:105,10:100,2000)))
x = [-3 27];
y = [27 0];
imagesc(x, y, fliplr(Mean_Velocity(:,:)))
%imagesc(x, y, slicedata, [0 intensity]);
    
    %axis equal;
    caxis([-1 0.3]);
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
    ax.XTick = -3:6:27;
    ax.YTick = 0:6:27;
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

