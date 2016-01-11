function [ f ] = Pulse( x,a)
%PULSE mimmicks a pulse signal. 

f = zeros(1,length(x));

for n=1:length(x)
   if (x(n)>=-1) && (x(n)<=1)
       p=a;
   else
       p=0;
   end
   
   f(n)=p;
   
end

end

