function [ x, y ] = Signal( f,n,m)

    x = n:0.05:m;
    y =f(x);

end
