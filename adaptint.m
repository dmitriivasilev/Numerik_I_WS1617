function Q =  adaptint(a,b,tol,f,regel)
Q = quadratur(a,b,1,f,regel);
err = abs(Q - quadratur(a,b,2,f,regel));
global c;
global iter;
if err > tol * abs(Q)
    iter = iter+1;
    if any(c) ~= ((a+b)/2)
        c = [c ((a+b)/2)];
    end
    Q = adaptint( a,(a+b)/2, tol, f, regel ) + adaptint( (a+b)/2 , b , tol , f, regel );
    
end

end