# Vending Machine

## Overview
This project implements a multi-product vending machine using Verilog HDL. 
The system supports money insertion, product selection, purchase validation, 
and balance display using a seven-segment display.

## Features
- Multiple product selection
- Incremental money loading
- Purchase validation (YES/NO)
- Balance retention and display
- Seven-segment display interfacing

## Modules
- vending_machine.v - The top module of the project
- main.v – Vending machine control logic
- bin_to_bcd.v – Binary to BCD converter
- seven_seg_driver.v – Display driver
- main_tb.v – Testbench

## Simulation 
Simulated using Xlinix Vivado and implemented on Nexys 4 DDR

## Documentation
Detailed report available in: `Report.pdf`
