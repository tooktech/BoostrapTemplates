function predict_labels = predictClass(feature, priorRate, mean, coVar)
    l_len = length(feature(:, 1));
    predict_labels = zeros(l_len, 1);
    n_label = length(priorRate(:, 1));
    for i = 1 : l_len
        class_type = 0;
        max = 0;
        for j = 1 : n_label
            temp = feature(i, :) - mean(j, :);
            ex_temp = -0.5 * (temp / coVar(:, :, j)) * temp';
            class_temp = (priorRate(j)/sqrt(det(coVar(:, :, j)))) * exp(ex_temp);
            if class_temp > max
                max = class_temp;
                class_type = j - 1;
            end
        end
        predict_labels(i) = class_type;
    end
end