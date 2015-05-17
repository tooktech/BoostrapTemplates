function mean = getMean(feature, labels, priorRate)
    f_len = length(feature(1, :));
    l_len = length(labels);
    n_label = length(unique(labels));
    mean = zeros(n_label, f_len);
    for i = 1 : l_len
       mean(labels(i) + 1, :) = mean(labels(i) + 1, :) + feature(i, :);
    end
    for i = 1 : n_label
        mean(i, :) = mean(i, :)/(l_len * priorRate(i));
    end
       
end
    
    