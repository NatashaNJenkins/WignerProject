function [ T,F,W ] = WigFun( a,b,n,m )
%

%Let this be the solution to the wigner transform of the gussian function.
%Where a is a real number and not imaginary 

[T,F]=meshgrid(n:0.05:m);

W=2*sqrt(pi)*exp((-1).*(T).^2 + 2*a.*T -(a^2)*0.5 + 2*(F.*b -2*pi.*(F.^2)))*exp(-b^2);

end

