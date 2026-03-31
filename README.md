# Fortran Euler Method Simulation

This project implements Euler's Method in Fortran to solve the motion of a charged particle under combined electric and gravitational fields.

## Problem Statement

A particle with the following properties:
- **Mass:** 10 gm (0.01 kg)
- **Charge:** 0.2 C
- **Electric Field:** E = 20 V/m
- **Gravitational Field:** g = −9.8 m/s²
- **Initial Velocity:** v₀ = −1.52 m/s
- **Initial Position:** x₀ = 7.52 m

**Objective:** Using Euler's Method, find the position and velocity over a suitable time interval until the velocity reaches 1.52 m/s. Calculate the percent error and generate position–time and velocity–time graphs.

## Requirements

- **Fortran Compiler:** gfortran or equivalent
- **Build System:** Optional (can compile directly with gfortran)
- **Plotting Tools:** Python with matplotlib (optional, for visualization)

## Installation & Compilation

1. Clone or download the repository:
   ```bash
   git clone https://github.com/Moniruz200/Fortran-Program-For-Euler-Method.git
   cd Fortran-Program-For-Euler-Method
   ```

2. Compile the Fortran source:
   ```bash
   gfortran -o euler_method euler_method.f90
   ```

3. Run the program:
   ```bash
   ./euler_method
   ```

## Usage

The program executes with predefined parameters based on the problem statement. You may modify the following parameters in the source code before compilation:
- Initial velocity
- Initial position
- Time step size (dt)
- Maximum time interval

The output includes:
- Position and velocity at each time step
- Percent error calculations
- Data points for graphing (if output file is generated)

## Output

The program generates:
- **Console Output:** Position, velocity, and error metrics at each iteration
- **Output File:** CSV formatted data file with results for external plotting

## Author

**Moniruz Zaman**

## License

This project is provided as-is for educational purposes.