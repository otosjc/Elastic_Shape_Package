%- test the distance function


clear; path(pathdef);
%close all

addpath('../functions')


load('../../data/raw/sample_curve001.mat','X_evol');
curve1 = squeeze(X_evol);
load('../../data/raw/sample_curve002.mat','X_evol');
curve2 = squeeze(X_evol);

% figure
% plotCurve(curve1)
% figure
% plotCurve(curve2)

%- Compute the shape distance between the curves a few times
%- each time downsampling the orignal curves just to check how much the
%time is going down.

tic
[d1] = dist_L2(curve1,curve2);
toc


