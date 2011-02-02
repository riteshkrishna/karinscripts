function [cidx] = createKemansCluster(genevalues, times)

rand('state',0);

[cidx, ctrs] = kmeans(genevalues, 16, 'dist','corr', 'rep',5,...
                                                        'disp','final');
figure
for c = 1:16
    subplot(4,4,c);
    plot(times,genevalues((cidx == c),:)');
    axis tight
end
suptitle('K-Means Clustering of Profiles');

figure
for c = 1:16
    subplot(4,4,c);
    plot(times,ctrs(c,:)');
    axis tight
    axis off    % turn off the axis
end
suptitle('K-Means Centroids of Clustered Profiles');