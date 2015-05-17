function class_Rate = getPriorRate(labels)
    n = length(labels);
    class_Rate = zeros(10, 1);
    for i = 0 : 9
        class_Rate(i+1) = sum(~(labels - i))/n;
    end
end
        
        
    
    
    
