function error_rate = hw1_main_a(X, Y, test, testlabels)
    params = hw1_train1a(X, Y);
    preds_train = hw1_test1a(params,X);
    preds_test = hw1_test1a(params,test);
    error_rate.train_error = sum(preds_train ~= Y)/length(Y(:, 1));
    error_rate.test_error = sum(preds_test ~= testlabels)/length(testlabels(:, 1));
end
