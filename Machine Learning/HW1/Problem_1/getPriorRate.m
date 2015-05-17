function priorRate = getPriorRate(labels)
    n_label = length(unique(labels));
    n = length(labels);
    priorRate = zeros(n_label, 1);
    for i = 0 : n_label - 1
        priorRate(i+1) = sum(~(labels - i))/n;
    end
end
        
        
    
    
    
