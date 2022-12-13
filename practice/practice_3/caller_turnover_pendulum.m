clc
clear all
close all force

ode = @call_turnover_pendulum;

t = 0: 0.01: 30;

x0 = [0,0.01,-1*pi/180,0]';

global M m l f g

M = 2;
m = 5;
l = 1;
f = 0;
g =9.815;

theta_des = 0;
Kp = 2;
Ki = 0.5;

int_err = 0;
err_prev = 0;

Y = x0';

for i = 2 : length(t)
    
  dt = t(i) - t(i-1);

err = theta_des - x0(3);% Ошибка
int_err = int_err + 0.5*(err + err_prev)*dt;% Интеграл ошибки (метод трапеций)

f = Kp*err + Ki*int_err;
    
[~,Y0] = ode45(ode,t(i-1:i),x0);

err_prev = err;

x0 = Y0(end,:)';
Y = [Y;x0'];

end

figure
subplot(2,1,1)
plot(t,Y(:,1),'LineWidth',2)
xlabel('Time')
ylabel('x(t)')
grid on
grid minor

subplot(2,1,2)
plot(t,Y(:,3),'LineWidth',2)
xlabel('Time')
ylabel('\theta(t)')
grid on
grid minor

x_p = (Y(:,1)-l*sin(Y(:,3)));
y_p = l*cos(Y(:,3));

lt=length(t);
minX = min(Y(:,1));
maxX = max(Y(:,1));

figure
clf
for i=1:10:lt

plot(x_p(1:i),y_p(1:i))
ylim([-l,l])
xlim([minX - l,maxX + l])
hold on
plot([Y(i,1) x_p(i)],[0 y_p(i)],'-ok','LineWidth',2)
hold on

pause(0.1)
if(i~=lt)
clf('reset')
end

end
