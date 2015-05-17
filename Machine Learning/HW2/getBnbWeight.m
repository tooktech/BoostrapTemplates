function w_bnb = getBnbWeight(model)
    p_mle = model.bnb_model.p_mle;
    p1 = p_mle(1, :);
    p2 = p_mle(2, :);
    not_p1 = 1 - p1;
    not_p2 = 1 - p2;
    w_bnb = log((p1 .* not_p2)./(p2 .* not_p1));
end