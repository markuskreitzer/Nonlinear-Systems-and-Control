syms a1 x1 x2 u
dv2 = -a1*x1^2 + x2*(-x1 - x2*x1^2 + x2 + u);
pretty(expand(dv2))
