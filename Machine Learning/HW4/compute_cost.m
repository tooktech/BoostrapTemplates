function costs = compute_cost(testpatches, centers)
    center_8 = centers.centers_8;
    center_16 = centers.centers_16;
    center_32 = centers.centers_32;
    center_64 = centers.centers_64;
    
    costs = zeros(4, 1);
    for i = 1 : length(testpatches(:, 1))
        temp = testpatches(i, :); % the current patch
        
        dist = (pdist2(center_8, temp)).^2;
        temp_min = min(dist);
        costs(1) = costs(1) + temp_min;
        
        dist = (pdist2(center_16, temp)).^2;
        temp_min = min(dist);
        costs(2) = costs(2) + temp_min;
        
        dist = (pdist2(center_32, temp)).^2;
        temp_min = min(dist);
        costs(3) = costs(3) + temp_min;
        
        dist = (pdist2(center_64, temp)).^2;
        temp_min = min(dist);
        costs(4) = costs(4) + temp_min;  
    end
end