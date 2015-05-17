function preds = hw1_test1b(params,test)
    priorRate = params.priorRate;
    mean = params.mean;
    %preds = predictClass_eye(test, priorRate, mean);
    preds = predictClass_eye_no_log(test, priorRate, mean);
end 
