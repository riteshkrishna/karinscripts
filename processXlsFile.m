function [R_1,R_2,R_3,OligoID,GeneID] = processXlsFile()

load karin;
numGenes = size(data,1);

barcode_1   = [82677,82678,82679,82680,90187,90188,90341,90342];
time_1      = [0,0.5,1,2,3,4,5.5,6.5];

barcode_2   = [47355,47356,47381,47382,47383,47396,47397,47400];
time_2      = [0,1,2,3,4,5,6.5,8];

barcode_3   = [47204,47205,47207,47352,47353,47354];
time_3      = [0,1,2,3,4,5,6.5];

R_1 = struct('barcode',barcode_1,'time',time_1,'data_cy3',zeros(numGenes,size(time_1,2)),'data_cy5',zeros(numGenes,size(time_1,2)));
R_2 = struct('barcode',barcode_2,'time',time_2,'data_cy3',zeros(numGenes,size(time_2,2)),'data_cy5',zeros(numGenes,size(time_2,2)));
R_3 = struct('barcode',barcode_3,'time',time_3,'data_cy3',zeros(numGenes,size(time_3,2)),'data_cy5',zeros(numGenes,size(time_3,2)));


% IA/IB Channels for Replicate 1 as defined by the label file (un codearrays from cell cycle 2009.docx)
replicate_1_cy3_map = containers.Map({82677,82678,82679,82680,90187,90188,90341,90342},{0,0.5,2,1,3,4,5.5,6.5});
replicate_1_cy5_map = containers.Map({82677,82678,82679,82680,90187,90188,90341,90342},{0.5,1,3,2,4,5.5,6.5,0});

% IA/IB Channels for Replicate 2
replicate_2_cy3_map = containers.Map({47355,47356,47381,47382,47383,47396,47397,47400},{8,0,3,4,1,2,6.5,5});
replicate_2_cy5_map = containers.Map({47355,47356,47381,47382,47383,47396,47397,47400},{6.5,8,2,3,0,1,5,4});

% IA/IB Channels for Replicate 3
replicate_3_cy3_map = containers.Map({47204,47205,47207,47352,47353,47354},{5,6.5,4,3,1,2});
replicate_3_cy5_map = containers.Map({47204,47205,47207,47352,47353,47354},{4,5,3,2,0,1});

% After how many columns the data matrix starts in .xls
col_offset = 2;

% Retrieve data for Replicate 1 - Cy3
keys_replicate_1 = keys(replicate_1_cy3_map);
for i=1:size(keys_replicate_1,2)
    key = keys_replicate_1{i};
    value = replicate_1_cy3_map(key);
    
    % find the col in header ; pos - col_offset
    headerToFind = strcat('IA-',int2str(key));
    headerToFind = strcat(headerToFind,'_MDS.mev');
    idx = find(ismember(Header_xls, headerToFind)==1);
    idx = idx - col_offset;
    
    if(idx <= 0)
        fprintf('Problem accessing the correct column in header');
    end
    
    % find the column in the cy3 data matrix where the retrieved data
    % should be put, such that the time series is ordered accendingly
    ind  = find(R_1.time == value);
    R_1.data_cy3(:,ind) = data(:,idx);
end

% Retrieve data for Replicate 1 - Cy5
keys_replicate_1 = keys(replicate_1_cy5_map);
for i=1:size(keys_replicate_1,2)
    key = keys_replicate_1{i};
    value = replicate_1_cy5_map(key);
    
    % find the col in header ; pos - col_offset
    headerToFind = strcat('IB-',int2str(key));
    headerToFind = strcat(headerToFind,'_MDS.mev');
    idx = find(ismember(Header_xls, headerToFind)==1);
    idx = idx - col_offset;
    
    if(idx <= 0)
        fprintf('Problem accessing the correct column in header');
    end
    
    % find the column in the cy3 data matrix where the retrieved data
    % should be put, such that the time series is ordered accendingly
    ind  = find(R_1.time == value);
    R_1.data_cy5(:,ind) = data(:,idx);
end

% Retrieve data for Replicate 2 - Cy3
keys_replicate_2 = keys(replicate_2_cy3_map);
for i=1:size(keys_replicate_2,2)
    key = keys_replicate_2{i};
    value = replicate_2_cy3_map(key);
    
    % find the col in header ; pos - col_offset
    headerToFind = strcat('IA-',int2str(key));
    headerToFind = strcat(headerToFind,'_MDS.mev');
    idx = find(ismember(Header_xls, headerToFind)==1);
    idx = idx - col_offset;
    
    if(idx <= 0)
        fprintf('Problem accessing the correct column in header');
    end
    
    % find the column in the cy3 data matrix where the retrieved data
    % should be put, such that the time series is ordered accendingly
    ind  = find(R_2.time == value);
    R_2.data_cy3(:,ind) = data(:,idx);
end

% Retrieve data for Replicate 2 - Cy5
keys_replicate_2 = keys(replicate_2_cy5_map);
for i=1:size(keys_replicate_2,2)
    key = keys_replicate_2{i};
    value = replicate_2_cy5_map(key);
    
    % find the col in header ; pos - col_offset
    headerToFind = strcat('IB-',int2str(key));
    headerToFind = strcat(headerToFind,'_MDS.mev');
    idx = find(ismember(Header_xls, headerToFind)==1);
    idx = idx - col_offset;
    
    if(idx <= 0)
        fprintf('Problem accessing the correct column in header');
    end
    
    % find the column in the cy3 data matrix where the retrieved data
    % should be put, such that the time series is ordered accendingly
    ind  = find(R_2.time == value);
    R_2.data_cy5(:,ind) = data(:,idx);
end


% Retrieve data for Replicate 3 - Cy3
keys_replicate_3 = keys(replicate_3_cy3_map);
for i=1:size(keys_replicate_3,2)
    key = keys_replicate_3{i};
    value = replicate_3_cy3_map(key);
    
    % find the col in header ; pos - col_offset
    headerToFind = strcat('IA-',int2str(key));
    headerToFind = strcat(headerToFind,'_MDS.mev');
    idx = find(ismember(Header_xls, headerToFind)==1);
    idx = idx - col_offset;
    
    if(idx <= 0)
        fprintf('Problem accessing the correct column in header - %d', idx)
    end
    
    % find the column in the cy3 data matrix where the retrieved data
    % should be put, such that the time series is ordered accendingly
    ind  = find(R_3.time == value);
    R_3.data_cy3(:,ind) = data(:,idx);
end

% Retrieve data for Replicate 3 - Cy5
keys_replicate_3 = keys(replicate_3_cy5_map);
for i=1:size(keys_replicate_3,2)
    key = keys_replicate_3{i};
    value = replicate_3_cy5_map(key);
    
    % find the col in header ; pos - col_offset
    headerToFind = strcat('IB-',int2str(key));
    headerToFind = strcat(headerToFind,'_MDS.mev');
    idx = find(ismember(Header_xls, headerToFind)==1);
    idx = idx - col_offset;
    
    if(idx <= 0)
        fprintf('Problem accessing the correct column in header');
    end
    
    % find the column in the cy3 data matrix where the retrieved data
    % should be put, such that the time series is ordered accendingly
    ind  = find(R_3.time == value);
    R_3.data_cy5(:,ind) = data(:,idx);
end
