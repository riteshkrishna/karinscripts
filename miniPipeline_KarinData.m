function miniPipeline_KarinData()

% Get all the data information
[R_1,R_2,R_3,OligoID,GeneID] = processXlsFile();

% For R_1
[genevalues_cy3_1,gene_cy3_1] = preprocessing_removeZeroAndNan(R_1.data_cy3,GeneID);
[genevalues_cy5_1,gene_cy5_1] = preprocessing_removeZeroAndNan(R_1.data_cy5,GeneID)
[commonGenes_1,genevalues_1] = getCommonDataFromCy3Cy5(gene_cy3_1,genevalues_cy3_1,gene_cy5_1,genevalues_cy5_1);
[genevalues_1,commonGenes_1] = preprocessing_removeLowProfileGenes(genevalues_1,commonGenes_1)
times_1 = R_1.time;
% Hierarchical Cluster
[cidx_hierarchy_R1] = createHierarchicalCluster(genevalues_1, times_1);
% K-mean cluster
[cidx_kmean_R1] = createKemansCluster(genevalues_1, times_1);
% Create Heatmap
createHeatMap(genevalues_1, times_1);
% Do PCA
createPCA(genevalues_1,commonGenes_1);

% For R_2
[genevalues_cy3_2,gene_cy3_2] = preprocessing_removeZeroAndNan(R_2.data_cy3,GeneID);
[genevalues_cy5_2,gene_cy5_2] = preprocessing_removeZeroAndNan(R_2.data_cy5,GeneID)
[commonGenes_2,genevalues_2] = getCommonDataFromCy3Cy5(gene_cy3_2,genevalues_cy3_2,gene_cy5_2,genevalues_cy5_2);
[genevalues_2,commonGenes_2] = preprocessing_removeLowProfileGenes(genevalues_2,commonGenes_2)
times_2 = R_2.time;
% Hierarchical Cluster
[cidx_hierarchy_R2] = createHierarchicalCluster(genevalues_2, times_2);
% K-mean cluster
[cidx_kmean_R2] = createKemansCluster(genevalues_2, times_2);
% Create Heatmap
createHeatMap(genevalues_2, times_2);
% Do PCA
createPCA(genevalues_2,commonGenes_2);


%% For R_3 - Note - It will crash because there is data for just one channel
% [genevalues_cy3_3,gene_cy3_3] = preprocessing_removeZeroAndNan(R_3.data_cy3,GeneID);
% [genevalues_cy5_3,gene_cy5_3] = preprocessing_removeZeroAndNan(R_3.data_cy5,GeneID)
% [commonGenes_3,genevalues_3] = getCommonDataFromCy3Cy5(gene_cy3_3,genevalues_cy3_3,gene_cy5_3,genevalues_cy5_3);
% [genevalues_3,commonGenes_3] = preprocessing_removeLowProfileGenes(genevalues_3,commonGenes_3)
% times_3 = R_3.time;
% createHierarchicalCluster(genevalues_3, times_3);
