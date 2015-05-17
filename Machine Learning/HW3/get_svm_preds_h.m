function [svm_preds, accuracy] = get_svm_preds_h(train_set, train_label, alpha, threshold, test_set, test_label, h)
    %use the threshold to fliter out the qualified support vectors?not the
    %train_set and train_label has already been standaridized.

    %standardlize test_set in the same way.
    len = length(test_set(:, 1));
    sample_std = std(test_set);
    sample_mean = mean(test_set);
    
    std_X = zeros(len, length(test_set(1, :)));
    for i = 1 : len 
        std_X(i, :) = (test_set(i, :) - sample_mean)./sample_std;
    end 
    test_set = std_X;
       
    flag = alpha > threshold;
    train_set = train_set(flag, :);
    train_label = train_label(flag, :);
    alpha = alpha(flag, :);

    dist_test = (pdist2(test_set, train_set)).^2;
    %h = quantile(dist_test(:), h_rate);
    k = exp(-1 * dist_test / (2 * h));
    svm_preds = hw3_test_ksvm(alpha, k, train_label);
    %accuracy = sum(svm_preds == test_label)/length(test_label); 
    preds = svm_preds;
    labels = test_label;
    
    accuracy.overall = sum(preds == labels)/len; 
    accuracy.truePositive = sum((preds + labels) == 2)/len;
    accuracy.trueNegative = sum((preds + labels) == -2)/len;
    accuracy.falsePositive = sum((preds + (-1*labels)) == 2)/len;
    accuracy.falseNegative = sum((preds + (-1*labels)) == -2)/len;  
 
end



