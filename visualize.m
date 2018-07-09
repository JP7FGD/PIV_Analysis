% visualize the velocity field
% 2018/07 Sujoy

% initial

nx = 120;
ny = 120;
nf = 2000;

%% load U

file = 'G:/PIV_OUT/still/o-08u_1.dat';
U =permute(loaddat(file,0,nx*ny*nf), [2 1 3]);


%% load V

file='G:/PIV_OUT/still/o-08v_1.dat';
V = permute(loaddat(file,0,nx*ny*nf), [2 1 3]);

%% visualize

% one comp

imagesc(fliplr(V(:,:,1000)))

%two comp

