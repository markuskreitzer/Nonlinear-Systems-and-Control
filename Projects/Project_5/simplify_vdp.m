syms x1 x2 u;
dx2 = (1 - x1^2)*x2 - x1 + u;
dx1 = (dx2 + x1)/(1-x1^2);
disp('dx1')
pretty(expand(dx1))
disp('dx2')
pretty(simplify(dx2))


