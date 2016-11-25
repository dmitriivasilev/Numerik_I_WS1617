function p = clenshaw_eval(c,x)

n = length(c)-1;

d = zeros(1,n+3);

for i = n+1:-1:1

    d(i) = c(i) + ( 2*x ) * d(i+1) - d(i+2);

end
    
d;
p = (1/2) * (d(1) - d(3));
    
end