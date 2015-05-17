function error_rate = prolbem2_main_2(X, Y, test, test_label)
    euc_dist = get_euclidean_dist(X, test);
    size_array = [100, 200, 400, 800];
    error_count = zeros(10, 4);
    for i = 1 : 4
        train_size = size_array(i);
        for count = 1 : 10
            error_count(count, i) = getKNN_error_rate(euc_dist, Y, test_label, train_size);
        end     
    end
    error_rate.mean = sum(error_count) ./ 10;
    error_rate.std = std(error_count);
end