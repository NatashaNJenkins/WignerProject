function [ F, y ] = ForierTransform( f )
%FORIERTRANSFORM Does the fourier transform of a function, truncated where
%appropriate only works on gaussian functions
% F = Transform array, y = x-axis values, i.e variable that describes F, f
% entry function

y=-20:0.1:20;
F=zeros(1,length(y));


for n=1:length(y)

    F(n) = integral( @(x) f(x).*exp(-2*1i*pi*y(n).*x),-inf,inf);

end

end

