function params = hw2_train_bnb(X, Y)
    X = full(X);
    class_count = length(unique(Y));
    train_size = length(X(:, 1));
    priors = zeros(class_count, 1);
    p_mle = zeros(class_count, length(X(1, :)));
    
    priors(1) = sum(Y == -1) / train_size;
    temp_index = (Y == -1);
    temp_feature = X(temp_index, :);
    p_mle(1, :) = (sum(temp_feature) + 1) / (sum(Y == -1) + 2);
     
    priors(2) = sum(Y == 1) / train_size;
    temp_index = (Y == 1);
    temp_feature = X(temp_index, :);
    p_mle(2, :) = (sum(temp_feature) + 1) / (sum(Y == 1) + 2);
    
    params.prior_rate = priors;
    params.p_mle = p_mle;
end