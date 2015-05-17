function error_rate = hw1_main_b(X, Y, test, testlabels)
    params = hw1_train1b(X, Y);
    preds_train = hw1_test1b(params,X);
    preds_test = hw1_test1b(params,test);
    error_rate.train_error = sum(preds_train ~= Y)/length(Y(:, 1));
    error_rate.test_error = sum(preds_test ~= testlabels)/length(testlabels(:, 1));
end