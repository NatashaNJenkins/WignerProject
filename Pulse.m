function [ f ] = Pulse( x,a,b)
%PULSE mimmicks a pulse signal. 

f = zeros(1,length(x));

for n=1:length(x)
   if (x(n)>=-b) && (x(n)<=b)
       p=a;
   else
       p=0;
   end
   
   f(n)=p;
   
end

end

