%- test SRVF and SRVF2B


clear; path(pathdef);
%close all

addpath('../functions')

%- example 1
load('../../data/raw/sample_curve001.mat','X_evol');
curve1 = squeeze(X_evol);
curve1srvf = SRVF(curve1);
curve1srvf2b = SRVF2B(curve1srvf);
figure
subplot(1,3,1)
plotCurve(curve1)
subplot(1,3,2)
plotCurve(curve1srvf)
subplot(1,3,3)
plotCurve(curve1srvf2b)

%- example 2
data = CreateSpirals(1,2);
curve2srvf = SRVF(data{1});
curve3srvf2b = SRVF2B(curve2srvf);
figure
subplot(1,3,1)
plotCurve(data{1})
subplot(1,3,2)
plotCurve(curve2srvf)
subplot(1,3,3)
plotCurve(curve3srvf2b)

