Gene_ID  = {};

for i=1:size(OligoID)
%for i=1:10    
    id = OligoID{i};
    seq = OligoSeq{i};
    
    idx = find(ismember(featureSeq, seq)==1);
    if(idx > 0)
        Gene_ID{end + 1} = featureID{idx};
    else
        Gene_ID{end + 1} = 'EMPTY';
    end
end

Gene_ID = Gene_ID';

for i=1:size(Gene_ID)
    Gene_ID{i} = strcat('GL50803_',Gene_ID{i});
end
