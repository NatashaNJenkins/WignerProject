function [ X,U,F ] = WigFun( a,b,n,m )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%at some point adress the imaginary numbers

[X,U]=meshgrid(n:0.1:m);

F=exp(-1.*X.^2).*exp(-2.*a.*X + (a^2-b^2)).*exp(-1.*U.^2).*2*sqrt(pi);

end

