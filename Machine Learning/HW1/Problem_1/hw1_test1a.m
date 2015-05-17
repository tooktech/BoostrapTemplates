function preds = hw1_test1a(params,test)
    priorRate = params.priorRate;
    mean = params.mean;
    coVar = params.coVar;
    preds = predictClass(test, priorRate, mean, coVar);
end 
