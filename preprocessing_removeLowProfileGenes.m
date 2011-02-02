function [genevalues,genes] = preprocessing_removeLowProfileGenes(genevalues,genes)

mask = genevarfilter(genevalues);
% Use the mask as an index into the values to remove the filtered genes.
genevalues = genevalues(mask,:);
genes = genes(mask);
numel(genes)

%removes genes that have very low absolute expression values
[mask, genevalues, genes] = genelowvalfilter(genevalues,genes,'absval',log2(3));
numel(genes)

% remove genes whose profiles have low entropy
[mask, genevalues, genes] = geneentropyfilter(genevalues,genes,'prctile',15);
numel(genes)