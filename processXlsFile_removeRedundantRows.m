
% Process Karin's xls file in a way that the twin readings for each
% Oligos/GeneIDs are merged together to create one line for each geneID

clear all;
load karin;

filtered_GeneID = {};
filtered_Data = [];

%totalGenes = size(GeneID,1);

%counter  = 0;
while(size(GeneID,1))
    
 %   counter = counter + 1;
    
    thisGene = GeneID{1};
    
    mean_value = [];
    
    if(isempty(strfind(thisGene, 'EMPTY')))
        idx = find(ismember(GeneID, thisGene)==1);
        values_data = data(idx,:);
        
        if (size(values_data,1) ~= 2)
           fprintf(' \n More than two instances of Oligos found for index = %s', thisGene)
        end
        
        for k=1:size(values_data,2)
            val_1 = values_data(1,k);
            val_2 = values_data(2,k);
            
            if( (val_1 <= 0) || (val_2 <= 0))
                if(val_1 <= 0)
                    mean_value = [mean_value val_2];
                else
                    mean_value = [mean_value val_1];
                end
            else
                mean_value = [mean_value (val_1 + val_2)/2];
            end
        end
        
        GeneID(idx) = []; % This is how you delete from cell array
        data(idx,:) = [];
        filtered_GeneID{end+1} = thisGene;
        filtered_Data = [filtered_Data ; mean_value];
    end
end
