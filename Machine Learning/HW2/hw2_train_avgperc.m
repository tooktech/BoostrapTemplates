function params = hw2_train_avgperc(X, Y, num_pass)
    X = full(X);
    %resize_factor = 2;
    train_size = length(X(:,1));
    feature_len = length(X(1,:));
    w_record = [];
    theta_record = [];
    v_record = [];
    w = zeros(1, feature_len);
    theta = 0;
    count = 0;
    for j = 1 : num_pass
        for i = 1 : train_size
            cur = X(i, :);
            predict = sign(dot(w, cur) - theta);
            if (predict ~= Y(i))
                w_record = [w_record; w];
                theta_record = [theta_record; theta];
                v_record = [v_record; count];
                w = w + Y(i) * cur;
                theta = theta - Y(i);
                count = 0;
            else
                count = count + 1;
            end
        end
    end
    w_record = [w_record; w];
    theta_record = [theta_record; theta];
    v_record = [v_record; count];
 
    w = (w_record' * v_record)'/sum(v_record);%compute the voted weight
    theta = (theta_record' * v_record)/sum(v_record);
    params.w = w;
    params.theta = theta;
end