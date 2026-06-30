% fft_reproduction.m  — grinding-signal-lab / 01-fft-basics
% Scaffolding (time vector, plotting, axis layout) is provided.

clear; clc; close all;

% --- Parameters (scaffolding) ---
fs = 1200;            % sampling frequency, Hz
T  = 1;               % duration, seconds
N  = fs * T;          % number of samples
t  = (0:N-1) / fs;    % time vector, seconds

% --- (1) constructing the signal --------------------------------
% Build a sum of sinusoids with frequencies and amplitudes YOU choose.
% Example shape (replace amplitudes/frequencies with your own choices):
%   x = A1*sin(2*pi*f1*t) + A2*sin(2*pi*f2*t);
x =5*sin(2*pi*500*t) ;  % <-- write this line yourself

% --- (2)  take the FFT ----------------------------------------
X = fft(x) ;   % <-- write this line yourself  (hint: fft(x))

% --- (3) build the magnitude + one-sided spectrum ------------
% Decide: how many bins are meaningful? where does Nyquist sit?
% Derive the frequency axis from fs and N — don't hard-code it.
% mag    = abs(X) / N;            % normalisation — justify the /N in your README
% mag_1  = mag(1:N/2+1);          % one-sided — justify the N/2+1 in your README
% mag_1(2:end-1) = 2*mag_1(2:end-1);   % why double the interior bins?
% f      = (0:N/2) * (fs/N);      % frequency axis — derive this
% (the lines above are commented so YOU reconstruct the reasoning, not paste it)
P2 = abs(X/N);
mag_1 = P2(1:N/2+1);
mag_1(2:end-1) = 2*mag_1(2:end-1);
f = fs/N*(0:(N/2));
plot(f,mag_1,"LineWidth",3) 
title("Single-Sided Amplitude Spectrum of X(t)")
xlabel("f (Hz)")
ylabel("|P1(f)|")
% --- Plotting (scaffolding) -----------------------------------------
figure('Color','w');

subplot(2,1,1);
plot(t, x, 'LineWidth', 1);
xlabel('Time (s)'); ylabel('Amplitude');
title('Time-domain signal'); grid on;
xlim([0 0.1]);   % show first 100 ms so the waveform is readable

subplot(2,1,2);
% stem(f, mag_1, 'filled');     % uncomment once your f and mag_1 exist
xlabel('Frequency (Hz)'); ylabel('Magnitude');
title('Single-sided amplitude spectrum'); grid on;
% xlim([0 fs/2]);
