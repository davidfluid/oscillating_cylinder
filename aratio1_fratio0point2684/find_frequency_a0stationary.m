clear all; fclose all;

cd G:\computations_dir\oscillating_cylinder\a_0_stationary\postProcessing\forceCoeffs_object\0;
fid = fopen('coefficient_0.csv','r');
A = fscanf(fid,'%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f\n', [13, 7257]);
%A = fscanf(fid,'%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f',[13, Inf]);
B = A';
fclose(fid);

time_ = B(:,1);
cl_ = B(:,4);

cl = B((2000:end),4);
time = B((2000:end),1);

plot(time,cl,'*');
set(gca,'linewidth',1,'fontsize',36);
xlabel('time [s]');
ylabel('cl');
grid on;


Y = fft(cl);
Fs = length(time)/(time(end)-time(1));                    % Sampling frequency

P2 = abs(Y/length(cl));
P1 = P2(1:length(cl)/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(length(cl)/2))/length(cl);
figure;
plot(f,P1);
title("Single-Sided Amplitude Spectrum of X(t)");
xlabel("f (Hz)");
ylabel("|P1(f)|");



