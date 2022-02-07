%- test the karcher mean functions to see if they are the same

clear; path(pathdef);
%close all

addpath('../functions')

data = CreateSpirals(10,2);
figure
for i = 1:10
    subplot(2,5,i)
    plotCurve(data{i})
end
tic
Mean1 = karcher_mean_cell(data);
toc
figure
plotCurve(Mean1)


data2 = zeros([size(data{1},2),size(data{1},1),size(data,2)]);
for i = 1:10
    data2(:,:,i) = data{i}';
end
tic 
Mean2 = karcher_mean_matrix(data2);
toc
figure
plotCurve(Mean2)