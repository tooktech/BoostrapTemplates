function [opt_lamda, opt_h, opt_accuracy, ret] = tune_parameter(X, Y)
    lamda_list = [1, exp(-1), exp(-2), exp(-3), exp(-4), exp(-5), exp(-6), exp(-7), exp(-8), exp(-9), exp(-10)]; 
    h_rate_list = [0.1, 0.25, 0.5, 0.75, 0.9];
    
    opt_accuracy = 0;
    opt_lamda = 0;
    opt_h = 0;
    seed = rng;%use the same seed to cut off the hold-out set
    index = 1; %use to indicate current lamda and h pair's value
    
    for i = 1 : length(lamda_list)
        for j = 1 : length(h_rate_list)
            %temp_accuracy = get_accuary(X, Y, lamda_list(i), h_rate_list(j), 0.7, seed);
            [temp_accuracy, train_set, train_label, alpha, h]= get_accuary(X, Y, lamda_list(i), h_rate_list(j), 0.7, seed);
            ret(index).lamda = lamda_list(i);
            ret(index).h = h;
            ret(index).accuracy = temp_accuracy;
            index = index + 1;
            if temp_accuracy > opt_accuracy
               opt_accuracy = temp_accuracy;
               opt_lamda = lamda_list(i);
               opt_h = h; 
            end
        end
    end
           
end 