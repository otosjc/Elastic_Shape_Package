%- test Resample

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


tmp1 = ReSampleCurve(curve1,600);
tmp2 = ReSampleCurve(curve2,600);

figure
plotCurve(tmp1)
figure
plotCurve(tmp2)
