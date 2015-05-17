function coVar = getCoVar(feature, labels, mean, priorRate)
    f_len = length(feature(1, :));
    l_len = length(labels);
    coVar = zeros(f_len, f_len, 10);
    for i = 1 : l_len
        temp = feature(i, :) - mean(labels(i)+1, :);
        coVar(:, :, labels(i)+1) = coVar(:, :, labels(i)+1) + temp' * temp;
        disp(i);
    end
    for i = 1 : 10
        coVar(:, :, i) = coVar(:, :, i)/(l_len * priorRate(i));
    end
end