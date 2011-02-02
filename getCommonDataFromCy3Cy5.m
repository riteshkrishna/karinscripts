function [commonGenes,genevalues] = getCommonDataFromCy3Cy5(genes_cy3,...
                                genevalues_cy3,genes_cy5,genevalues_cy5)
                            
commonGenes = {};

for i=1:size(genes_cy3)
    gene = genes_cy3{i};
    idx = find(ismember(genes_cy5, gene)==1);
    if(idx > 0)
        commonGenes{end+1} = gene;
    end
end

commonGenes = commonGenes';

genevalues = [];

for i=1:size(commonGenes)
    gene = commonGenes{i};
    
    idx_cy3 = find(ismember(genes_cy3, gene)==1);
    idx_cy5 = find(ismember(genes_cy5, gene)==1);
    
    values_cy3 = genevalues_cy3(idx_cy3,:);
    % Note - The xls file has multiple occurances of geneIDs (2 OligoIDs used for each gene)
    % So we just take the average - Better idea would be to correct the xls
    % file itself.
    mean_values_cy3 = mean(values_cy3,1);
    values_cy5 = genevalues_cy5(idx_cy5,:);
    % Same process as above for Cy5 as well
    mean_values_cy5 = mean(values_cy5,1);
    
    %logRatio = log2(values_cy3./values_cy5);
    logRatio = log2(mean_values_cy3./mean_values_cy5);
    
    genevalues = [genevalues; logRatio];
end
