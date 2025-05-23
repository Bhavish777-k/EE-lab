%define contents
r1 = 0.641;
x1 = 1.106;
r2 = 0.332;
x2 = 0.464;
xm = 26.3;
v_phase = 460/sqrt(3);
n_sync = 1800;
w_sync = 188.5;
v_th = v_phase * (xm / sqrt(r1^2 +(x1 +xm)^2));
z_th = ((1j*xm) *(r1 + 1j*x1)) / (r1 +1j*(x1 + xm));
r_th = real(z_th);
x_th = imag(z_th);
s = (0:1:50) / 50;
s(1) = 0.001;
nm = (1-s)*n_sync;
%define slip range
for ii = 1:51
    t_ind1(ii) = (3*v_th^2 *r2/ s(ii)) / (w_sync* ((r_th + r2/s(ii))^2 + (x_th + x2)^2));
end
for ii = 1:51
    t_ind2(ii) = (3*v_th^2 *(2*r2)/ s(ii)) / (w_sync* ((r_th + (2*r2)/s(ii))^2 + (x_th + x2)^2));
end

for ii = 1:51
    t_ind3(ii) = (3*v_th^2 *(r2/2)/ s(ii)) / (w_sync* ((r_th + (r2/2)/s(ii))^2 + (x_th + x2)^2));
end

%plotting
plot(nm,t_ind1,'Color','k','LineWidth',2.0);
hold on;
plot(nm,t_ind2,'Color','k','LineWidth',2.0,'LineStyle','-.');
hold on;
plot(nm,t_ind3,'Color','k','LineWidth',2.0,'LineStyle','--');
hold on;
xlabel('itn_{ind}','FontWeight','bold');
ylabel('tau_{ind}','FontWeight','bold');
title('Induction motor torque-speed charecteristics','FontWeight','bold');
legend('Original R_{2}','Doubled R_{2}','Half R_{2}');
grid on;
hold off;

