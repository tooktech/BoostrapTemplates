function plot_errorBar(error_rate)
    x = [1000, 2000, 4000, 8000];
    figure
    errorbar(x, error_rate.mean, error_rate.std);
    hold on
    plot(x, error_rate.mean, '-mo');
    title('The learning curve of 1NN classifier');
    xlabel('Train Set Size');
    ylabel('Error Rate');
    
    
    
    