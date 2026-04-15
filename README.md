# grinding-signal-lab

Signal processing and ML experiments for grinding process monitoring and adaptive control.

Building toward: **Real-Time Adaptive Control of SiC Wafer Grinding Using Multi-Sensor Fusion and Physics-Informed ML**

## Project Structure

```
01-fft-basics/              — FFT, PSD, windowing, spectrograms
02-angular-resampling/      — Time-to-angular domain resampling
03-feature-extraction/      — RMS, kurtosis, crest factor, spectral features
04-svm-classification/      — SVM on toy data, then vibration data
05-bearing-fault-diagnosis/  — Full pipeline reproducing Bouali et al. 2025
datasets/                   — Links to public datasets (not stored here)
utils/                      — Shared helper functions
```

## Datasets Used

| Dataset | Source | Description |
|---------|--------|-------------|
| Ottawa Bearing | [Mendeley Data](https://data.mendeley.com/datasets/v43hmbwxpm/2) | Bearing vibration under variable speed (used in Bouali et al. 2025) |
| CWRU Bearing | [CWRU](https://engineering.case.edu/bearingdatacenter) | Classic bearing fault benchmark |
| *More to be added as projects progress* | | |

## Progress

- [ ] `01` — FFT of sine wave, noisy signal, two-frequency signal
- [ ] `01` — PSD computation, Hanning window effect
- [ ] `02` — Angular resampling from encoder + vibration signal
- [ ] `03` — Compute RMS, kurtosis, CF, IF on healthy vs. faulty signals
- [ ] `04` — SVM on 2D toy data, plot decision boundary
- [ ] `05` — Full reproduction of Bouali et al. 2025 results

## Tools

- Python 3.10+
- NumPy, SciPy, Matplotlib, scikit-learn
- Jupyter notebooks for exploration, `.py` scripts for reusable code

## About

I'm an Electrical Engineering / Automation student at UFAS1 (Algeria), building skills toward PhD research in intelligent grinding process control for semiconductor wafer manufacturing. This repo documents my learning journey from fundamentals to research-grade implementations.

## References

- Bouali, F., Fedala, S., André, H., & Felkaoui, A. (2025). Intelligent bearing faults diagnosis in non-stationary conditions. *Comptes Rendus Mécanique*, 353, 499-518.
- Randall, R.B. & Antoni, J. (2011). Rolling element bearing diagnostics — a tutorial. *MSSP*, 25(2), 485-520.
