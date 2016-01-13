function [ y ] = Gauss( x,a,b)

    y = exp(-0.5*(x-a).^2 + 1i*b.*x);

end
