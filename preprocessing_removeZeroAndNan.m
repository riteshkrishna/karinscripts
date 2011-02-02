function [genevalues,genes] = preprocessing_removeZeroAndNan(genevalues,genes)

% Remove empty genes
emptySpots = any((genevalues == 0),2);
genevalues(emptySpots,:) = [];
genes(emptySpots) = [];
numel(genes)

%Reomve NaN indices
nanIndices = any(isnan(genevalues),2);
genevalues(nanIndices,:) = [];
genes(nanIndices) = [];
numel(genes)
