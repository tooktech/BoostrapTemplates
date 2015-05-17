function error_rate = hw2_problem2_main(X, Y, testdata, testlabels, num_pass)
    params = hw2_train_perc(X, Y, num_pass);
    preds = hw2_test_perc(params, testdata);
    error_rate = sum(preds ~= testlabels) / length(preds);
end