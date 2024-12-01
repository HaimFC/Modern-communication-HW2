
# Assignment 2 - Modern Communications

## Overview of the Assignment
This assignment focuses on analyzing and simulating the error probability of a Binary Phase Shift Keying (BPSK) modulation scheme over a discrete memoryless additive white noise (AWN) channel. Two noise models are considered:
1. Gaussian Noise
2. Laplace Noise

The assignment involves:
1. Analytical derivations of error probability under the Maximum A Posteriori (MAP) decision rule.
2. Simulating the transmission and decoding processes.
3. Comparing results for both noise distributions.

---

## Questions and Solutions

### Question 1: Error Probability Analysis of BPSK Constellation

#### **1.1 Analytical Derivation**
1. **Gaussian Noise (1.1.1 and 1.1.2):**
   - The MAP decision rule is derived based on minimizing the error probability.
   - The average error probability (SER) for Gaussian noise is expressed as:
     \[
     P_e = Q\left(\sqrt{2 \cdot SNR}\right)
     \]
     where \( Q \) is the Q-function, and \( SNR = \frac{E_s}{N_0} \).

2. **Laplace Noise (1.1.3 and 1.1.4):**
   - The MAP decision rule is derived for Laplace noise.
   - The SER for Laplace noise is given by:
     \[
     P_e = \frac{1}{2} \exp\left(-2\sqrt{SNR}\right)
     \]

3. **Comparison (1.1.5):**
   - At high SNR, Gaussian noise provides a lower error probability compared to Laplace noise. At low SNR, Laplace noise performs better.

---

#### **1.2 Simulation Results**
The MATLAB implementation performs the following steps:
1. **Gaussian Noise:**
   - Symbols are generated using `randsrc`.
   - Gaussian noise is added using `randn`.
   - Decoded symbols are analyzed for error probability as a function of SNR.

2. **Laplace Noise:**
   - Laplace noise is generated using a custom function `laprnd`.
   - Similar steps are followed to calculate error probability as a function of SNR.

3. **Comparison:**
   - Error probabilities for both Gaussian and Laplace noise are plotted on the same graph, validating analytical results.

---

### Question 2: Error Probability for Two Symbols

#### **2.1 MAP Decision Rule:**
For two symbols \( s_0 \) and \( s_1 \):
- If \( s_0 \) is transmitted, the received signal has a uniform distribution.
- If \( s_1 \) is transmitted, the received signal has a Gaussian distribution.

#### **2.2 Error Probability:**
The error probability is calculated for both cases based on the overlap between the probability density functions.

---

### Question 3: Error Analysis for 4-QAM Constellation

#### **3.1 Suboptimal Decision Regions:**
Decision regions are defined as circles centered around each constellation point. This simplifies the analysis but may increase error probability compared to optimal decision regions.

#### **3.2 Error Probability:**
The probability of the received symbol falling in the correct decision region is calculated as a function of \( SNR \) for each constellation point.

---

## Summary
This assignment explores the performance of BPSK modulation under Gaussian and Laplace noise using both analytical and simulation-based approaches. The MATLAB implementation confirms theoretical insights and highlights the practical implications of different noise models on communication systems.
