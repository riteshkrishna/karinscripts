function [genevalues,genes] = preprocessing(genevalues,genes)

[genevalues,genes] = preprocessing_removeZeroAndNan(genevalues,genes);
[genevalues,genes] = preprocessing_removeLowProfileGenes(genevalues,genes);
