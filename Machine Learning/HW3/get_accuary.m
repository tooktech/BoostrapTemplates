function [accuracy, train_set, train_label, alpha, h]= get_accuary(X, Y, lambda, h_rate, hold_out_rate, seed)
    len = length(X(:, 1));
    train_size = round(len * hold_out_rate);
    
    sample_std = std(X);
    sample_mean = mean(X);
    
    std_X = zeros(len, length(X(1, :)));
    for i = 1 : len 
        std_X(i, :) = (X(i, :) - sample_mean)./sample_std;
    end    
    %randomly generate random array without repeat elements
    rng(seed);
    rand_array = randperm(len);
    train_set = std_X(rand_array(1 : train_size), :);
    train_label = Y(rand_array(1 : train_size), :);
    test_set = std_X(rand_array(train_size+1 : end), :);
    test_label = Y(rand_array(train_size+1 : end), :);
   
    %get apha(weight), it needs to find out the cut-off 
    dist_train = (pdist2(train_set, train_set)).^2;
    h = quantile(dist_train(:), h_rate);
    k = exp(-1 * dist_train / (2 * h));
    alpha = hw3_train_ksvm(k,train_label,lambda);
    
    %use alpha make predications
    dist_test = (pdist2(test_set, train_set)).^2;
    %use quantile to get h is extraordinaliy important
    h = quantile(dist_test(:), h_rate);
    k = exp(-1 * dist_test / (2 * h));
    preds = hw3_test_ksvm(alpha, k, train_label);
    accuracy = sum(preds == test_label)/length(test_label); 
     
end
