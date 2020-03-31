function [eval] = blackbox(x,p)
    
    global index
    index = index + 1;
    fprintf('number of calls: %i\n', index)
    
    lb = p{1};
    ub = p{2};
    
    x_unscaled = scaling(x',lb,ub,2); % unscale variables for evaluation
    
    %   Calling the blackbox evluator
    
    f = 10*(x_unscaled(2)-x_unscaled(1)^2);  % objective function
    g1 = 1 - x_unscaled(1); % constraint function
    
    eval = [f, g1];


end