function mean = getMean(feature, labels, priorRate)
    f_len = length(feature(1, :));
    l_len = length(labels);
    mean = zeros(10, f_len);
    for i = 1 : l_len
       mean(labels(i) + 1, :) = mean(labels(i) + 1, :) + feature(i, :);
    end
    for i = 1 : 10
        mean(i, :) = mean(i, :)/(l_len * priorRate(i));
    end
       
end
    
    