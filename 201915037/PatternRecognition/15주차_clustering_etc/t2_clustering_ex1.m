%% 계층적 군집 1
clear all; close all; clc;

rng default;  % For reproducibility
X = [1 2;2.5 4.5;2 2;4 1.5;4 2.5];

figure;
plot(X(:,1), X(:,2), 'ko'); xlim([0 5]); ylim([1 5]); grid on;

Y = pdist(X)
squareform(Y)

Z = linkage(Y)

figure;
dendrogram(Z)

I = inconsistent(Z)

mean([1 1 2.06155])
std([1 1 2.06155])

T = cluster(Z,'cutoff',1.2)
T = cluster(Z,'cutoff',0.8)

T = cluster(Z,'maxclust',2)
T = cluster(Z,'maxclust',3)

%% 계층적 군집 2
clear all; close all; clc;

rng('default'); % For reproducibility
X = [(randn(20,2)*0.75)+1; (randn(20,2)*0.25)-1];

figure;
scatter(X(:,1),X(:,2));
title('Randomly Generated Data');

Z = linkage(X);

figure;
dendrogram(Z)

T = cluster(Z,'maxclust',2);

figure;
gscatter(X(:,1),X(:,2),T)

%%
clear all; close all; clc;

load fisheriris;

rng('default') % For reproducibility
eva = evalclusters(meas,'kmeans','CalinskiHarabasz','KList',1:10);

eva
figure; 
plot(eva);

Z = linkage(meas,'average','euclidean');

figure;
dendrogram(Z, 0)

figure;
dendrogram(Z)


I = inconsistent(Z)

T = cluster(Z,'maxclust',eva.OptimalK);

cutoff = median([Z(end-2,3) Z(end-1,3)]);

figure;
dendrogram(Z, 0, 'ColorThreshold',cutoff)

figure;
dendrogram(Z, 'ColorThreshold',cutoff)

