function part4_ode

t = 0:0.001:2;
initial_x = 0;
initial_dxdt = 0;
initial_dx2dt2 = 0;

[t,x] = ode45( @rhs, t, [initial_x, initial_dxdt, initial_dx2dt2]);
fig = figure;
hold on;
plot(t, x(:,1))
plot(t, heaviside(t))
xlabel('t');
ylabel('x');
print(fig, 'solution.png', '-dpng')

    function dx=rhs(t, x)
        dx = zeros(size(x));
        dx(1) = x(1) - x(1) * u1(t);
        dx(2) = (1 - log(x(3)))*x(2) - x(2)*u1(t);
        dx(3) = -x(1)*x(3) - x(3)*u1(1) + u2(t);
    end

    function ret = u1(t)
        if t < 1
            ret = 1;
        else
            ret = 0;
        end
    end

function ret = u2(t)
        if t < 1
            ret = 1;
        else
            ret = 0;
        end
    end

    function ret = linearizer(t, x)
        compensation = -cos(x(2))*x(1)^4;
        ret = u1(t) + compensation;
    end
end
