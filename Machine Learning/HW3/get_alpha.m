function alpha = get_alpha(X, Y, lambda, h_rate, hold_out_rate)
    len = length(X(:, 1));
    train_size = round(len * hold_out_rate);
    
    sample_std = std(X);
    sample_mean = mean(X);
    
    std_X = zeros(len, length(X(1, :)));
    for i = 1 : len 
        std_X(i, :) = (X(i, :) - sample_mean)./sample_std;
    end
    
    train_set = std_X(1 : train_size, :);
    train_label = Y(1 : train_size, :);
    %test_set = std_X(train_size+1 : end, :);
    %test_label = Y(train_size+1 : end, :);
    
    %get apha(weight), it needs to find out the cut-off 
    dist_train = (pdist2(train_set, train_set)).^2;
    h = quantile(dist_train(:), h_rate);
    %h = quantile(hdata, h);
    k = exp(-1 * dist_train / (2 * h));
    alpha = hw3_train_ksvm(k,train_label,lambda);     
end
