# Human-HealthCare-FPGA
# Human Health Care Parameter Analysis System using FPGA

# Project Overview
This project presents a simulation-validated FPGA-based system for real-time health parameter analysis. It monitors key vitals — ECG, Temperature, SpO2, and Sleep — for multiple age groups: Infants, Children, Adults, and Pregnant Women. The system is designed using Verilog HDL and simulated using Xilinx ISE 12.4, targeting the Spartan-3 FPGA board.

> Note: This project has been functionally verified through simulation only. No physical implementation on FPGA hardware was performed.

# Tools and Technologies
- Simulation Software: Xilinx ISE 12.4
- Design Language: Verilog HDL
- Target FPGA (for design): Spartan-3 XC3S400 (FG320 package)

# System Features
- Age-specific health validation logic
- Modular Verilog architecture
- Range-based health abnormality detection
- Sensor inputs: ECG, Body Temperature, Blood Oxygen Saturation (SpO2), Sleep Duration


# Key Parameters by Category

| Category    | ECG (bpm) | Temp (°F) | SpO2 (%) | Sleep (hrs)  |
|-------------|-----------|-----------|----------|--------------|
| Infant      | 100–160   | 97–100    | 90–100   | 12–16        |
| Child       | 70–120    | 97–100    | 90–100   | 10–14        |
| Adult       | 60–100    | 97–100    | 90–100   | 7–9          |
| Pregnant    | 60–100    | 97–100    | 90–100   | 8–10         |

# Results Summary
- Logic Utilization: 17 slices, 28 LUTs, 38 IOBs
- Total Delay: 12.146 ns (Logic: 64.7%, Routing: 35.3%)
- Functionality: Successfully simulated 8 test cases across all age groups (Normal & Abnormal conditions)
