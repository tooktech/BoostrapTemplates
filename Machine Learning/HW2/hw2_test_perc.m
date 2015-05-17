function preds = hw2_test_perc(params, test)
    test = full(test);
    w = params.w;
    theta = params.theta;
    test_size = length(test(:, 1));
    preds = zeros(test_size, 1);
    for i = 1 : test_size
        preds(i) = sign(dot(w, test(i, :)) - theta);
    end
end