function normalizedData = normalizeData(data)
    data_mean = mean(data);
    data_std = std(data);
    [row, column] = size(data);
    center_data = zeros(row, column); 
    std_data = zeros(row, column);
    for i = 1 : row
        center_data(i, :) = data(i, :) - data_mean;
        std_data(i, :) = (data(i, :) - data_mean)./data_std;
    end
    normalizedData.center_data = center_data;
    normalizedData.std_data = std_data;
end