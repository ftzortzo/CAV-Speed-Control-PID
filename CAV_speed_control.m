% Simple PID Controller for Speed Control
clear; clc;

% Simulation setup
dt = 0.01; T = 10; N = T / dt;
v_ref = 20;  % desired speed

% PID gains
Kp = 2; Ki = 0.5; Kd = 0.1;

% Initialization
v = 0; x = 0;
e_prev = v_ref - v;
e_int = 0;

% Log variables
time = zeros(1,N); vel = zeros(1,N); acc = zeros(1,N);

% Main loop
for k = 1:N
    t = (k-1)*dt;
    e = v_ref - v;
    e_int = e_int + e * dt;
    e_der = (e - e_prev) / dt;

    % PID formula
    u = Kp * e + Ki * e_int + Kd * e_der;

    % Update system
    v = v + u * dt;
    x = x + v * dt;

    % Log data
    time(k) = t; vel(k) = v; acc(k) = u;
    e_prev = e;
end

% Plotting
figure;
subplot(2,1,1);
plot(time, vel, 'b', 'LineWidth', 2); hold on;
yline(v_ref, '--r'); title('Speed vs Time'); xlabel('Time'); ylabel('Speed');

subplot(2,1,2);
plot(time, acc, 'm', 'LineWidth', 2);
title('Control Input (Acceleration)'); xlabel('Time'); ylabel('u(t)');
