plot(sort(alpha, 'descend'))

alpha = get_alpha(data, labels, exp(-8), 0.5, 1)

[svm_preds, accuracy] = get_svm_preds(data, labels, alpha, 0.001, testdata, testlabels, 0.5)
[svm_preds, accuracy] = get_svm_preds(data, labels, alpha, 0.9, testdata, testlabels, 0.5)