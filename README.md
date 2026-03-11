# fft-minimal-solvers

## 1. Generate the Input Data

Run `fft-minimal-solvers/evaluate/generate_data.m`.
When prompted in the terminal, enter the problem name, for example:

```
"problem_8ptF_radial_1s"
```

This script generates the corresponding input coefficients for the problem and saves them to:

```
fft-minimal-solvers/data/input_data/problem_8ptF_radial_1s_5000.csv
```

Example output in MATLAB:

<img width="325" height="60" alt="image" src="https://github.com/user-attachments/assets/172c9f9c-8f95-4748-bf48-f1572a855d34" />


## 2. Run the Solver

Run `fft-minimal-solvers/solvers/run.m`.
When prompted in the terminal, enter the problem name:

```
problem_8ptF_radial_1s
```

The computed solutions of the polynomial system will be saved to:

```
fft-minimal-solvers/data/output_data/our_sols/sols_problem_8ptF_radial_1s_5000.csv
```

Example output in MATLAB:

<img width="600" height="80" alt="image" src="https://github.com/user-attachments/assets/4248328e-bdd5-4fa8-90f5-47e1fc5446f6" />


## 3. Evaluate the Solver

Run `fft-minimal-solvers/evaluate/evaluate_solver.m`.
 When prompted in the terminal, enter the problem name:

```
"problem_8ptF_radial_1s"
```
This script evaluates the solver performance using the generated input data and computed solutions.

Example output in MATLAB:

<img width="350" height="210" alt="image" src="https://github.com/user-attachments/assets/9f7c8400-c87b-419d-833c-4d3ddd59801a" />


