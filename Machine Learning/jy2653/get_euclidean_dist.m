function euc_dist = get_euclidean_dist(data, testdata)
    euc_dist = sqrt(bsxfun(@plus,sum(data.^2,2),sum(testdata.^2,2)')-2*(data*testdata'));
end