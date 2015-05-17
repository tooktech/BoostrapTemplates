function params = hw1_train1a(X, Y)
    priorRate = getPriorRate(Y);
    mean = getMean(X, Y, priorRate);
    coVar = getCoVar(X, Y);
    params.priorRate = priorRate;
    params.mean = mean;
    params.coVar = coVar;
end