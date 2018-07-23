function ode_test

t = 0:0.001:5;
initial_x = 0;
initial_dxdt = 0;

[t,x] = ode45( @rhs, t, [initial_x, initial_dxdt]);
fig = figure;
hold on;
plot(t, x(:,1))
plot(t, heaviside(t))
xlabel('t');
ylabel('x');
print(fig, 'solution.png', '-dpng')

    function dxdt=rhs(t, x)
        dxdt_1 = sin(x(2)) + linearizer(t, x);
        dxdt_2 = x(1)^4 * cos(x(2)) + linearizer(t, x);
        dxdt = [dxdt_1; dxdt_2];
    end

    function ret = v(t)
        if t < 1
            ret = 1;
        else
            ret = 0;
        end
    end

    function ret = linearizer(t, x)
        compensation = -cos(x(2))*x(1)^4;
        ret = v(t) + compensation;
    end
end
