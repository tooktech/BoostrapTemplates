function accuracy = getKNNAccuracy(X, Y, test, test_label, train_size)
    sample_size = length(X(:, 1));
    rand_array = randperm(sample_size);
    train_set = X(rand_array(1:train_size), :);
    train_label = Y(rand_array(1:train_size), :);
    preds = hw1_nn(train_set, train_label, test);
    accuracy = (sum(preds ~= test_label))/length(test_label(:, 1));
end
