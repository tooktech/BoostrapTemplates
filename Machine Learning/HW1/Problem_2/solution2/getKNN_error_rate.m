function accuracy = getKNN_error_rate(euc_dist, labels, test_label, train_size)
    sample_size = length(labels(:, 1));
    rand_array = randperm(sample_size);
    sub_dist = euc_dist(rand_array(1:train_size), :);
	train_label = labels(rand_array(1:train_size), :);
	preds = hw1_nn(train_label, sub_dist);
    accuracy = (sum(preds ~= test_label))/length(test_label(:, 1));
end
