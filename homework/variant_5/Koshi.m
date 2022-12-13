function [Theta] = Koshi(t, X)

global Vhod
m = 10;
k = 15;
g = 1.\(Vhod.g*t.^2);
Theta = zeros(4, 1);

Theta(1) = X(2);
Theta(2) = - (g* sin(X(1)))/X(3) - 2*X(4)*X(2)/(X(3)) ;
Theta(3) = X(4);
Theta(4) = X(3)*X(2)^2 - (k*X(3))/m + g*cos(X(1));

end
