function acc_rate = prolbem2_main(X, Y, test, test_label)
    size_array = [100, 200, 400, 800];
    accuracy = zeros(1, 4);
    for i = 1 : 4
        train_size = size_array(i);
        for count = 1 : 10
            accuracy(i) = accuracy(i) + getKNNAccuracy(X, Y, test, test_label, train_size);
        end     
    end
    acc_rate = accuracy ./ 10;
    plot(size_array, acc_rate);
end
