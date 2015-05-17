function labels = predictClass(feature, priorRate, mean, coVar)
    l_len = length(feature(:, 1));
    labels = zeros(l_len, 1);
    for i = 1 : l_len
        temp = feature(i, :);
        class_type = 0;
        max = 0;
        for j = 1 : 10
            temp = temp - mean(j, :);
            %ex_temp = -0.5 * temp * inv(coVar(:, :, j)) * temp';
            ex_temp = -0.5 * (temp / coVar(:, :, j)) * temp';
            disp(ex_temp);
            class_temp = (priorRate(j)/sqrt(det(coVar(:, :, j)))) * exp(ex_temp);
            if class_temp > max
                max = class_temp;
                class_type = j - 1;
            end
        end
        labels(i) = class_type;
    end
end