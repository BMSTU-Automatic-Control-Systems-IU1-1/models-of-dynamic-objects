clear variables
close all
clc

t = 0:0.01:40;
X = ones(4, 1);
global Vhod
Vhod.g = 9.815;

[T, X_R] = ode45(@Koshi,t,X);


figure(1)
yyaxis left;
plot(t,X_R(:,1));
yyaxis right;
plot(t,X_R(:,3));
legend("X1","X2");

gIzm = 7.2 : 0.2 : 10.8;

figure(2)
for i = 1: length(gIzm)

Vhod.m = gIzm(i);
[T, X_R_6] = ode45(@Koshi,t,X);
plot(T,X_R_6(:,3),'LineW',1);
hold on;


end
hold off;

for i = 1:3
X0 = [
    round(10*rand(1),0);
    round(10*rand(1),0);
    round(10*rand(1),0);
    round(10*rand(1),0)
    ];
[T, X_R] = ode45(@Koshi,t,X0);

figure
subplot (2,1,1);
plot (X_R(:,1),X_R(:,2),'-d','MarkerIndices',1) ;
ylabel ('X1')
subplot (2,1,2);
plot (X_R(:,3),X_R(:,4),'-d','MarkerIndices',1) ;
ylabel ('X2')
end

figure
for i = 1: length(gIzm)

Vhod.g = gIzm(i);
X0 = [
    round(10*rand(1),0);
    round(10*rand(1),0);
    round(10*rand(1),0);
    round(10*rand(1),0)
    ];
[T, X_R_6] = ode45(@Koshi,t,X0);

subplot (2,1,1);
title("Phase")
plot (X_R_6(:,1),X_R_6(:,2),'-d','MarkerIndices',1) ;
ylabel ('X1')
hold on;
subplot (2,1,2);
plot (X_R_6(:,3),X_R_6(:,4),'-d','MarkerIndices',1) ;
ylabel ('X2')
hold on;
end

figure(12)
for i = 1: length(gIzm)
Vhod.g = gIzm(i);
X0 = [
    round(10*rand(1),0);
    round(10*rand(1),0);
    round(10*rand(1),0);
    round(10*rand(1),0)
    ];
[T, X_R] = ode45(@Koshi,t,X0);

subplot (2,1,1);
plot (X_R(:,1)) ;
hold on
ylabel ('X1')
subplot (2,1,2);
plot (X_R(:,3)) ;
ylabel ('X2')

hold on;

end
