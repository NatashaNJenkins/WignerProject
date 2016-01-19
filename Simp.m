function [ F ] = Simp( f , n , m , h)
%f = function to intergrate, n i lower limit, m i upper limit, s it is the
%inteval size

x = n:h:m;

w = ones(1,length(x)); w(2:2:length(x)-1) = 4; w(3:2:length(x)-2) = 2; w = w*h/3; 

Y = f(x);

F = sum(w.*Y);

end

