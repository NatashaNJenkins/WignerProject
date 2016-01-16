function [ T,F,W ] = Wigner( f,n,m )
%WIGNER function can produce a Wigner transform of any function f. n and m
%are the limits of the square matrix
[T,F]=meshgrid(n:0.2:m);
W = zeros(length(F),length(T));
for i = 1:length(T)
    for j = 1:length(F)
        
        W(i,j)=integral(@(t) f(T(i,j)+0.5.*t).*conj(f(T(i,j)-0.5.*t)).*exp(-1i*2*pi.*F(i,j).*t),-inf,inf);
    
    end
end


end

