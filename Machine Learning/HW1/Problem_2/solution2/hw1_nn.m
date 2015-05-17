function preds = hw1_nn(Y, dis)
    [min_dis, min_index] = min(dis);
    preds = Y(min_index, :);
end