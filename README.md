Gamma-Corrected RGB Lighting Controller

Project Overview:
This project implements a gamma-corrected RGB LED lighting controller that generates a smooth purple breathing light effect using PWM. The system combines a custom-designed PCB with a modular Verilog-based PWM engine and verified simulation waveforms.
The design focuses on practical digital logic, timing control, and manufacturable hardware.

What It Does:
Generates PWM signals for RGB LEDs
Applies gamma correction for perceptually smooth brightness
Produces a breathing (fade in / fade out) animation
Drives LEDs using low-side NMOS switching

Key Features:
3-channel PWM output
Gamma LUT (4-bit brightness → 8-bit duty cycle)
Parameterized tick generator
Modular Verilog architecture
Custom KiCad schematic and PCB layout
Simulation-verified functionality(Performed using Icarus Verilog and GTK Wave)

Hardware Design:
Low-side NMOS transistor switching for each LED channel
Current-limiting resistors
Header for PWM input signals
Two-layer PCB designed in KiCad

Digital Design(Verilog modules):
top.v – System integration and breathing control
tick_gen.v – Timing pulse generator
gamma_lut.v – Gamma correction lookup table
pwm.v – PWM generator
tb_top.v – Testbench

Future Improvements:
Add a push-button interface to change colors and animation speed at runtime 
Store multiple lighting profiles (solid, breathing, pulse) selectable at runtime
Add UART or USB interface to control the LED behavior from a PC


