function preds = hw2_test_bnb(params,test)
test = full(test);
row_dim = size(test,1);
class_size = length(params.prior_rate);
labels = zeros(1,row_dim);
for i = 1:row_dim
    class_index = -1;
    
    for j = 1 : class_size
        temp_array_xj = test(i,:);
        temp_array_prob = params.mle(j,:);
        
        sum_first = log(temp_array_prob).*temp_array_xj;
        sum_second = log((1-temp_array_prob)).*(1-temp_array_xj);
        sumTotal = sum(sum_first)+sum(sum_second)+log(params.prior_rate(j));
        if(j==1)
            max = sumTotal;
            % for news.mat class_index = 1;
            class_index = -1;
        elseif(sumTotal>max)
            max = sumTotal;
            % for news.mat class_index = j;
            class_index = 1;
        end
    end
    labels(1,i) = class_index;
end
preds = labels';
end