%% Pe of 4-PAM using analytical expression
clear all;
close all;
clc;
%intialization
snr_db = -4:2:10;
num_snr_db = length(snr_db);
num_sim = 10e5;
A = 1;
% Pe using analytical expression 
Pe_analytical = zeros(1,num_snr_db);
for i = 1:num_snr_db
 snr_lin = 10^(0.1*snr_db(i));
 Pe_analytical(i) = (3/2)*qfunc(sqrt(2*snr_lin));
end
% Pe using Monte carlo simulation
Pe_simulation = zeros(1,num_snr_db);
for j = 1:num_snr_db
 snr_lin = 10^(0.1*snr_db(j));
 count = 0;
 for k = 1:num_sim
 n = sqrt(1/(2*snr_lin))*randn(1) + 1i*sqrt(1/(2*snr_lin))*randn(1);
 if rand < 0.25
 sm = -3*A;
 elseif (rand > 0.25) && (rand < 0.5)
 sm = -A;
 elseif (rand > 0.5) && (rand < 0.75)
 sm = A;
 else
 sm = 3*A;
 end
 r = sm + n;
 ds = [];
 ds(1) = (-3*A)^2 - 2*real(conj(r)*(-3*A));
 ds(2) = (-A)^2 - 2*real(conj(r)*(-A));
 ds(3) = A^2 - 2*real(conj(r)*A);
 ds(4) = (3*A)^2 - 2*real(conj(r)*(3*A));
 arg_min = min(ds);
 if arg_min == ds(1) 
 shat = -3*A;
 elseif arg_min == ds(2) 
 shat = -A;
 elseif arg_min == ds(3)
 shat = A;
 else
 shat = 3*A;
 end
 if (shat ~= sm)
 count = count + 1;
 end
 end
 Pe_simulation(j) = count/num_sim;
end
%% Pe of 8-ary PAM using monte carlo simulation
Pe_simulation2 = zeros(1,num_snr_db);
for j = 1:num_snr_db
 snr_lin = 10^(0.1*snr_db(j));
 count2 = 0;
 for k = 1:num_sim
 n = sqrt(1/(2*snr_lin))*randn(1) + 1i*sqrt(1/(2*snr_lin))*randn(1);
 if rand < 0.125
 sm = -7*A;
 elseif (rand > 0.125) && (rand < 0.25)
 sm = -5*A;
 elseif (rand > 0.25) && (rand < 0.375)
 sm = -3*A;
 elseif (rand > 0.375) && (rand < 0.5)
 sm = -A;
 elseif (rand > 0.5) && (rand < 0.625)
 sm = A;
 elseif (rand > 0.625) && (rand < 0.75)
 sm = 3*A;
 elseif (rand > 0.75) && (rand < 0.875)
 sm = 5*A;
 else
 sm = 7*A;
 end
 r = sm + n;
 ds2 = [];
 ds2(1) = (-7*A)^2 - 2*real(conj(r)*(-7*A));
 ds2(2) = (-5*A)^2 - 2*real(conj(r)*(-5*A));
 ds2(3) = (-3*A)^2 - 2*real(conj(r)*(-3*A));
 ds2(4) = (-A)^2 - 2*real(conj(r)*(-A));
 ds2(5) = A^2 - 2*real(conj(r)*A);
 ds2(6) = (3*A)^2 - 2*real(conj(r)*(3*A));
 ds2(7) = (5*A)^2 - 2*real(conj(r)*(5*A));
 ds2(8) = (7*A)^2 - 2*real(conj(r)*(7*A));
 arg_min = min(ds2);
 if arg_min == ds2(1) 
 shat = -7*A;
 elseif arg_min == ds2(2) 
 shat = -5*A;
 elseif arg_min == ds2(3)
 shat = -3*A;
 elseif arg_min == ds2(4)
 shat = -A;
 elseif arg_min == ds2(5)
 shat = A;
 elseif arg_min == ds2(6)
 shat = 3*A;
 elseif arg_min == ds2(7)
 shat = 5*A;
 else
 shat = 7*A;
 end
 if (shat ~= sm)
 count2 = count2 + 1;
 end
 end
 Pe_simulation2(j) = count2/num_sim;
end
% Plotting the both Pe
semilogy(snr_db,Pe_analytical,'-m')
hold on; grid on;
semilogy(snr_db,Pe_simulation,'o')
semilogy(snr_db,Pe_simulation2,'*c')
hold off
xlabel('SNR(dB)')
ylabel('Probability of error')
title('Probability of error vs SNR for 4-PAM and 8-PAM')
legend('Pe:Analytical for 4-PAM','Pe:Simulation for 4-PAM','Pe:Simulation for 8-PAM')
