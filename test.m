%Plotsthhe Pulse function and its fourier transform

y=0:0.1:20;
F=zeros(1,length(y));
p=Pulse(y,1);
plot(y,p)

for n=1:length(y)

    F(n) = integral( @(x) Pulse(x,1).*exp(-2*1i*pi*y(n).*x),-inf,inf);

end
plot(y,F)




%plotting the fourier transform of a gaussian signal and also plotting the
%signal iself

a=1;
b=0;
[x1,y1] = Signal(@(x) Gauss(x,a,b),-10,10);
plot(x1,y1);

figure
[x2,y2] = ForierTransform(@(x) Gauss(x,a,b),-10,10);
plot(x2,y2);

%plotting the numerical solution to the wigner transform of the gaussian
%function

figure
[T,F,W] = Wigner(@(x) Gauss(x,a,b),-10,10);
surf(real(T),real(F),real(W))



