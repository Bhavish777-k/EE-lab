% Initialize current amplitudes (21 values in the range 0-60 A)
i_a = (0:20) * 3;
% Initialize other values
v_phase = zeros(1, 21);
e_a = 277.0;
x_s = 1.0;
theta = 36.57 * (pi / 180); % Converted to radians
% Calculate v_phase for each current level
for ii = 1:21
v_phase(ii) = sqrt(e_a^2 - (x_s * i_a(ii) * cos(theta))^2) - (x_s * i_a(ii) * sin(theta));
end
% Calculate terminal voltage from the phase voltage
v_t = v_phase * sqrt(3);

plot(i_a, v_t, 'Color', 'k', 'Linewidth', 2.0);
xlabel('Line Current (A)', 'Fontweight', 'Bold');
ylabel('Terminal Voltage (V)', 'Fontweight', 'Bold');
title('Terminal Characteristic for 0.8 PF Lagging Load', 'Fontweight','Bold');
grid on;
axis([0 60 400 550]);