# Probability-of-error-for-4-PAM-and-8-PAM
# MATLAB Simulation: Probability of Error for 4-PAM and 8-PAM

## Overview

This MATLAB simulation demonstrates the Monte carlo Simulation of the Probability of Error (Perror) for 4-PAM (Pulse Amplitude Modulation) and 8-PAM schemes. The simulation involves generating random symbols, applying additive white Gaussian noise (AWGN), and then estimating the probability of error through symbol comparison.

## Prerequisites

- MATLAB (R2018b or later recommended)

## Files

1. `PER_4PAM_8PAM.m`: The main MATLAB script that performs the simulation.
   
## Usage

1. Clone or download this repository to your local machine.

2. Open MATLAB and navigate to the directory where the repository is located.

3. Open the `PER_4PAM_8PAM.m` script in MATLAB.

4. Adjust simulation parameters as needed, such as modulation order (4-PAM or 8-PAM), signal-to-noise ratio (SNR), and number of simulation trials.

5. Run the `PER_4PAM_8PAM.m` script.

6. The script will simulate the Probability of error estimation for the specified modulation scheme and SNR values, and then display the results in the MATLAB console and plots.

## Simulation Workflow

1. Random PAM symbols are generated for the given modulation order.

2. AWGN is added to the symbols to simulate noise.

3. The received symbols are estimated back to the transmitted symbols using decision boundaries.

4. The estimated Perror is calculated by comparing the original symbols with the estimated symbols.

5. Simulation is repeated for multiple SNR values to analyze the impact of noise.

## Customization

Feel free to modify the simulation parameters, such as modulation order and SNR levels, to observe how they affect the probability of error. You can also extend this simulation to include other modulation schemes or investigate the effects of various channel impairments.

## Acknowledgments

This simulation is based on standard concepts of digital communication and modulation theory. You can find more information about PAM and error probability calculations in textbooks and online resources on digital communication.

## Disclaimer

This simulation is intended for educational and illustrative purposes only. The results obtained from this simulation may not perfectly match real-world scenarios due to simplifications made in the model.

