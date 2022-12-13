function dx = call_turnover_pendulum(t,x)

global M m l f g

dx = zeros(4,1);

Mmat = [1 0 0 0; 0 (M + m) 0 -m*l*cos(x(3)); 0 0 1 0; 0 -cos(x(3)) 0 l];

dx = Mmat^(-1) * [x(2), f - m*l*x(4)^2 * sin(x(3)), x(4), g * sin(x(3))]';

end
