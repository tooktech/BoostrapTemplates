function preds = hw2_test_bnb(params, test)
    test = full(test);
    prior_rate = params.prior_rate;
    p_mle = params.p_mle;
    not_p_mle = 1 - params.p_mle;
    class_count = length(p_mle(:, 1));
    test_size = length(test(:, 1));
    preds = zeros(test_size, 1);
    for i = 1 : test_size
        item = test(i, :);
        not_item = 1 - item;%the vector for not appear element, record as 1
        temp_p = zeros(class_count, 1);
        for j = 1 : class_count
            p_mle_vector = log(p_mle(j, :)); %access the p_mle for each class
            not_p_mle_vector = log(not_p_mle(j, :));
            appear_vector = p_mle_vector(item == 1);%only extract those appear
            not_appear_vector = not_p_mle_vector(not_item == 1);
            temp_p(j) = sum(appear_vector) + sum(not_appear_vector) + log(prior_rate(j));
        end
        %temp_p = temp_p .* prior_rate;
        [max_value, index] = max(temp_p);
        if index == 1
            preds(i) = -1;
        else 
            preds(i) = 1;
        end
    end
end