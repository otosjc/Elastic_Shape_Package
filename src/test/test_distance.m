%- test the distance function


clear; path(pathdef);
%close all

addpath('../functions')


load('../../data/raw/sample_curve001.mat','X_evol');
curve1 = squeeze(X_evol);
load('../../data/raw/sample_curve002.mat','X_evol');
curve2 = squeeze(X_evol);

figure
plotCurve(curve1)
figure
plotCurve(curve2)

%- Compute the shape distance between the curves a few times
%- each time downsampling the orignal curves just to check how much the
%time is going down.

tic
[dist1,q2aligned1] = dist_elastic_and_alignment(curve1,curve2);
toc

tic
tmp1 = ReSampleCurve(curve1,100);
tmp2 = ReSampleCurve(curve2,100);
toc

tic
[dist2,q2aligned2] = dist_elastic_and_alignment(tmp1,tmp2);
toc

tic
tmp1 = ReSampleCurve(curve1,30);
tmp2 = ReSampleCurve(curve2,30);
toc

tic
[dist3,q2aligned3] = dist_elastic_and_alignment(tmp1,tmp2);
toc
