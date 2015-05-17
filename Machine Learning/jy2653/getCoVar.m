function coVar = getCoVar(feature, labels)
    f_len = length(feature(1, :));
    n_label = length(unique(labels));
    coVar = zeros(f_len, f_len, n_label);
    for i = 0 : n_label - 1
        coVar(:, :, i+1) = cov(feature(labels == i, :));
    end
end