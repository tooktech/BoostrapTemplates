function params = hw1_train1b(X, Y)
    priorRate = getPriorRate(Y);
    mean = getMean(X, Y, priorRate);
    params.priorRate = priorRate;
    params.mean = mean;
end