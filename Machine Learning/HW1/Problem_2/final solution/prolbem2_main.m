function error_rate = prolbem2_main(X, Y, test, test_label)
    size_array = [1000, 2000, 4000, 8000];
    error_count = zeros(10, 4);
    for i = 1 : 4
        train_size = size_array(i);
        for count = 1 : 10
             error_count(count, i) = getKNN_error_rate(X, Y, test, test_label, train_size);
        end     
    end
	error_rate.mean = sum(error_count) ./ 10;
	error_rate.std = std(error_count);
end
