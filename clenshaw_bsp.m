function clenshaw_bsp

g = @(x) atan(x)

c = clenshaw_coeff(g,10);
suka = clenshaw_eval(c,0.5)



end