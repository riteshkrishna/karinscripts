% cidx      = cluster indices
% genevalue = Data matrix with gene values
% commongenes = gene names corresponding to the values in genevalue
%
% This operation should be used on the indices (cidx) produced by the kmean
% and other culstering algorithms provided by matlab
function [structWithGeneNamesAndValues] = findGeneNamesInACluster(cidx,genevalues,commongenes)

unique_indices = unique(cidx);
total_clusters =  size(unique_indices);

structWithGeneNamesAndValues = struct('genes',{},'values',{});

for i=1:size(unique_indices)
    current_index = unique_indices(i);
    
   structWithGeneNamesAndValues(i).values = genevalues((cidx == current_index),:);
   structWithGeneNamesAndValues(i).genes = commongenes((cidx == current_index),:);
   
end
