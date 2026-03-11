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



## Correspondence Between Paper Problems and Code

The mapping between the problems described in the paper and the problem names used in the code is listed below.

| # | Problem in Paper | Code Name |
|---|---|---|
| 1 | Rel. pose F + λ (8pt) | problem_8ptF_radial_1s |
| 2 | Rel. pose E + f (6pt) | problem_relpose_6p_focal |
| 3 | Rel. pose f + E + f (6pt) | problem_relpose_6p_onefocal |
| 4 | Stitching fλ + R + fλ (3pt) | problem_stitching |
| 5 | Rel. pose E + fλ (7pt, elim. λ) | problem_relpose_7p_fr_1s_partial_elim |
| 6 | Triangulation from satellite im | problem_satellite_triang |
| 7 | Optimal PnP (Hesch) | problem_opt_pnp_hesch |
| 8 | Rolling shutter pose | problem_rollingshutter|
| 9 | Abs. pose P4Pfr (elim. f) | problem_p4p_fr_iccv17 |
|10 | Rel. pose E + fλ (7pt) | problem_relpose_7p_fr_1s |
|11 | Abs. pose refractive P5P | problem_p5p_refractive |
|12 | Abs. pose quivers | problem_pose_quiver |
|13 | Optimal PnP (Cayley) | problem_opt_pnp_nakanoC |
|14 | Rel. pose λ₁ + F + λ₂ (9pt) | problem_9pt2radial |
