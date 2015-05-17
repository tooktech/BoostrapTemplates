function centers = streaming_kemeans(patches, k)
    centers = patches(1:k, :);
    c_count = ones(k, 1);
    for i = k+1 : length(patches(:, 1));
        temp = patches(i, :); % the current patch
        dist = pdist2(centers, temp); % can use distance to replace square
        [temp_min, min_index] = min(dist);
        c_count(min_index) = c_count(min_index) + 1;
        temp_count = c_count(min_index);
        centers(min_index, :) = (1 - 1/temp_count) * centers(min_index, :) + 1/temp_count * temp;  
    end 
end