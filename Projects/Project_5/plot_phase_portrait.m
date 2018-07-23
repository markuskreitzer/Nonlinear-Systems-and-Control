fig = figure;
plot(x1.Data, x2.Data)
title('Phase Portrait')
xlabel('X1')
ylabel('X2 (dX1)')
print(fig, 'phase_portrait_vdp_stable.png', '-dpng')
