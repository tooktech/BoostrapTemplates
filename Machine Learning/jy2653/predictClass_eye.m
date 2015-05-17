function predict_labels = predictClass_eye(feature, priorRate, mean)
    f_len = length(feature(1, :));
    l_len = length(feature(:, 1));
    predict_labels = zeros(l_len, 1);
    n_label = length(priorRate(:, 1));
    sqrt_det = sqrt(f_len);
    %sqrt_det = sqrt(det(eye(f_len)));
    for i = 1 : l_len
        class_type = 0;
        max = -Inf;
        for j = 1 : n_label
            temp = feature(i, :) - mean(j, :);
            ex_temp = -0.5 * (temp * temp');
            %ex_temp = -0.5 * (temp / eye(f_len)) * temp';
            class_temp = log(priorRate(j)/sqrt_det) + ex_temp;
            %class_temp = (priorRate(j)/sqrt(det(eye(f_len)))) * exp(log(ex_temp));
            if class_temp > max
                max = class_temp;
                class_type = j - 1;
            end
        end
        predict_labels(i) = class_type;
    end
end