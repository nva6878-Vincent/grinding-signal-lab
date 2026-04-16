# 02 — SINDy Introduction: Recovering Equations from Data

**Goal:** Learn Sparse Identification of Nonlinear Dynamics (SINDy) by applying it to a
damped oscillator — a system with a known equation — then verify the recovery is correct.

**Why this matters for my PhD:**  
SiC grinding generates vibration and force signals governed by unknown physical equations.
SINDy is a method that can discover those equations directly from sensor data, making
ML models interpretable rather than black-box. This notebook is the foundation for that.

**Status:** 🔲 Not started — picking this up after FFT basics (01-fft-basics) are done.

---

## What is SINDy?

SINDy assumes the dynamics of a system can be written as:

```
ẋ = f(x)
```

where f is sparse — meaning only a few terms out of many candidates actually matter.

It works in 3 steps:
1. **Measure** the state x(t) and estimate its derivative ẋ(t)
2. **Build** a library of candidate functions: [1, x, x², sin(x), x·ẋ, ...]
3. **Sparse regression** — find the fewest terms that explain ẋ

If the true equation is `ẋ = -0.1x - 2ẋ`, SINDy should recover exactly that,
ignoring all the other candidate terms.

---

## System: Damped Harmonic Oscillator

The test system for this notebook:

```
ẍ + 2ζω₀ẋ + ω₀²x = 0
```

Rewritten as a first-order system (state: [x, ẋ]):

```
ẋ₁ = x₂
ẋ₂ = -ω₀²·x₁ - 2ζω₀·x₂
```

Parameters used: ω₀ = 2.0, ζ = 0.1 (lightly damped — like a grinding wheel spindle).

**Why this system?**  
Mathematically identical structure to a vibrating grinding wheel shaft.
Same equations, different physical meaning. Learning on this = learning on grinding.

---

## Exercises

### Ex 1 — Simulate the oscillator
- Generate x(t) using `scipy.integrate.solve_ivp`
- Plot displacement and velocity vs time
- Observe exponential decay envelope

### Ex 2 — Estimate derivatives
- Compute ẋ numerically from x(t) using finite differences
- Compare to the true derivative from simulation
- Understand noise sensitivity

### Ex 3 — Build the candidate library
- Construct Θ(X): columns = [1, x₁, x₂, x₁², x₁x₂, x₂², sin(x₁), ...]
- Visualize the library as a heatmap
- Count: how many candidates vs how many are actually in the true equation?

### Ex 4 — Sparse regression (LASSO)
- Solve: ẋ = Θ(X) · Ξ with L1 regularization
- Recover the coefficient matrix Ξ
- Check: did it find -ω₀² and -2ζω₀ correctly?

### Ex 5 — Validate recovered model
- Simulate forward using the SINDy-recovered equation
- Compare trajectory to original simulation
- Plot error over time

---

## Files

```
02-sindy-intro/
├── README.md               ← this file
├── sindy_oscillator.py     ← main script (exercises 1–5)
├── notes.md                ← paper reading notes + observations
└── plots/
    ├── oscillator_sim.png
    ├── library_heatmap.png
    └── recovery_validation.png
```

---

## Resources Used

- Brunton & Kutz — *Data-Driven Science and Engineering*, Chapter 7 (free: databookuw.com)
- Brunton YouTube — "SINDy" lectures (Data Driven Dynamical Systems playlist)
- Original SINDy paper: Brunton, Proctor, Kutz (2016), PNAS

---

## Key Result to Report

> SINDy recovered the damped oscillator equation from simulated data with
> coefficients within X% of true values using a library of N candidate terms.
> Only 2 out of N terms were selected (sparse).

*(fill in after running)*

---

## Connection to Main Research

| This notebook | PhD application |
|---|---|
| Damped oscillator | Grinding wheel vibration |
| State: [x, ẋ] | State: [force, AE signal, vibration] |
| Known equation (verification) | Unknown equation (discovery) |
| SINDy recovery | Physics-informed grinding model |

Next step after this: `03-pysr-intro` — let PySR search for the equation structure
automatically, without a pre-built library.

---

*Part of the MEXT PhD preparation journey — grinding-signal-lab*  
*Started: [date]*  
*Completed: [date]*
