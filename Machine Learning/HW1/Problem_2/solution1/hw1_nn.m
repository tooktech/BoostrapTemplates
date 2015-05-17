function preds = hw1_nn(X, Y, test)
    dis = get_euclidean_dist(X, test);
    [min_dis, min_index] = min(dis);
    preds = Y(min_index, :);
end