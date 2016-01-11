%Plotsthhe Pulse function and its fourier transform

y=0:0.1:20;
F=zeros(1,length(y));
p=Pulse(y,1);
plot(y,p)

for n=1:length(y)

    F(n) = integral( @(x) Pulse(x,1).*exp(-2*1i*pi*y(n).*x),-inf,inf);

end
plot(y,F)