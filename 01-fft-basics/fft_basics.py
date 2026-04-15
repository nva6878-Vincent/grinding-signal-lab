"""
01 - FFT Basics
===============
Learn: FFT, PSD, windowing, spectrograms

Exercise 1: Generate a sine wave, compute FFT, see the frequency peak
Exercise 2: Add noise, see how the peak survives
Exercise 3: Two frequencies — see two peaks
Exercise 4: Apply Hanning window, compare spectra
Exercise 5: Generate impulse-like signal (simulating bearing fault), see broadband energy

Run: python fft_basics.py
"""

import numpy as np
import matplotlib.pyplot as plt

# ============================================================
# Exercise 1: Single sine wave → FFT
# ============================================================

Fs = 10000          # Sampling frequency (Hz)
T = 1.0             # Duration (seconds)
f1 = 1000           # Signal frequency (Hz)

t = np.linspace(0, T, int(Fs * T), endpoint=False)
x = np.sin(2 * np.pi * f1 * t)

# Compute FFT
X = np.fft.fft(x)
freqs = np.fft.fftfreq(len(x), 1/Fs)

# Plot only positive frequencies
mask = freqs >= 0
plt.figure(figsize=(10, 4))
plt.plot(freqs[mask], np.abs(X[mask]) / len(x))
plt.xlabel('Frequency (Hz)')
plt.ylabel('Amplitude')
plt.title('Exercise 1: FFT of 1000 Hz sine wave')
plt.xlim(0, 2000)
plt.grid(True)
plt.tight_layout()
plt.savefig('ex1_single_sine_fft.png', dpi=150)
plt.show()

# TODO: Exercise 2 — add noise: x_noisy = x + 0.5 * np.random.randn(len(x))
# TODO: Exercise 3 — two frequencies: x2 = sin(2π·500·t) + 0.5·sin(2π·1200·t)
# TODO: Exercise 4 — apply Hanning window before FFT, compare
# TODO: Exercise 5 — create impulsive signal, compute kurtosis
