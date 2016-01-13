function [ F, y ] = ForierTransform( f , n , m)
%FORIERTRANSFORM Does the fourier transform of a function, truncated where
%appropriate only works on gaussian functions
% F = Transform array, y = x-axis values, i.e variable that describes F, f
% entry function

y=n:0.1:m;
F=zeros(1,length(y));


for n=1:length(y)

    F(n) = integral( @(x) f(x).*exp(-2*1i*pi*y(n).*x),-inf,inf);

end

end

