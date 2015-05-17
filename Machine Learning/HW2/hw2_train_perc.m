function params = hw2_train_perc(X, Y, num_pass)
    X = full(X);
    train_size = length(X(:,1));
    feature_len = length(X(1,:));
    w = zeros(1, feature_len);
    theta = 0;
    for j = 1 : num_pass
        for i = 1 : train_size
            cur = X(i, :);
            predict = sign(dot(w, cur) - theta);
            if (predict ~= Y(i))
                w = w + Y(i) * cur;
                theta = theta - Y(i);
            end
        end
    params.w = w;
    params.theta = theta; 
    end 