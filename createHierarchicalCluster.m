function [clusters] = createHierarchicalCluster(genevalues, times)

corrDist = pdist(genevalues, 'corr');
clusterTree = linkage(corrDist, 'average');

clusters = cluster(clusterTree, 'maxclust', 16);

figure
for c = 1:16
    subplot(4,4,c);
    plot(times,genevalues((clusters == c),:)');
    axis tight
end
suptitle('Hierarchical Clustering of Profiles');