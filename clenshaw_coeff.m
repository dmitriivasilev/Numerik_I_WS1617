function c = clenshaw_coeff(f,n)

format long

c = zeros(1,n+1);

s = zeros(0,n+1);

for k = 0:n
        
    for l = 0:n
        
        s(l+1) =  ( f ( cos( (2*l + 1)/(n+1) * (pi/2) ) ) ) * ( cos ( k * (2*l + 1)/(n+1) * (pi/2) ) );
        
    end
    
    c(k+1) = ( 2/(n+1) ) * sum(s);
    
end

c

end