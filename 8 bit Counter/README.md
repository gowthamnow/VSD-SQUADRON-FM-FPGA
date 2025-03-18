# 8-bit Counter FPGA Project - Synthesis, Simulation, and Hardware Implementation

## 📂 Project Overview
This project implements an **8-bit synchronous counter** designed in Verilog. It is fully tested with a testbench and ready for FPGA implementation. The design supports synthesis using **Yosys**, place & route with **NextPNR**, and simulation with **Icarus Verilog** or equivalent tools.

---

## 🗂 Project Structure
```
├── Makefile            # Automation for build, synthesis, simulation
├── top.v               # 8-bit Counter Verilog design
├── top_tb.v            # Testbench for functional simulation
├── top_tb              # Compiled testbench simulation binary
├── top_tb.vcd          # VCD waveform output of simulation
├── VSDSquadronFM.pcf   # FPGA pin constraints
├── top.json            # Yosys synthesized netlist
├── top.asc             # Place & Route result from NextPNR
├── top.bin             # FPGA bitstream for programming
├── top.timings         # Timing analysis report
```

---

## ⚙️ Tools & Requirements
- **Yosys** (Synthesis)
- **NextPNR** (Place and Route)
- **IceStorm / iceprog** (Bitstream generation and flashing)
- **GTKWave** (for viewing simulation waveforms)
- **Icarus Verilog / ModelSim** (Simulation)
- **Lattice ICE40 FPGA Board or compatible FPGA**

---

## 🚀 Build, Simulate & Flash Instructions
### 1. **Synthesis & Place & Route**
```bash
make pnr
```

### 2. **Generate Bitstream**
```bash
make build
```

### 3. **Run Simulation**
```bash
make sim
```
_View the simulation waveform using GTKWave:_
```bash
gtkwave top_tb.vcd
```

### 4. **Flash to FPGA**
```bash
sudo make flash
```

---

## 🛡️ 8-bit Counter Features
- Counts from **0 to 255 (8-bit width)**
- **Synchronous counting** triggered by clock
- Reset functionality to reset the counter
- Modular design for easy integration
- **Waveform dump (.vcd)** for simulation analysis

---

## 🧠 File Description
| File             | Purpose                                                               |
|------------------|-----------------------------------------------------------------------|
| `top.v`          | Verilog module implementing the 8-bit synchronous counter             |
| `top_tb.v`       | Testbench to simulate and verify the counter operation                |
| `top_tb.vcd`     | VCD file with simulation waveforms                                    |
| `top.json`       | Yosys synthesized netlist                                             |
| `top.asc`        | NextPNR place & route output                                          |
| `top.bin`        | FPGA Bitstream ready for programming                                  |
| `top.timings`    | Timing Report for verifying setup/hold constraints                    |
| `VSDSquadronFM.pcf` | FPGA pin constraint file                                           |
| `Makefile`       | Automation of build, simulation, synthesis, flashing                  |

---

## 🔧 Makefile Targets
| Target      | Description                                   |
|------------ |-----------------------------------------------|
| `sim`       | Run the functional simulation                  |
| `pnr`       | Synthesize and run place & route               |
| `build`     | Generate the FPGA bitstream                    |
| `flash`     | Flash the bitstream onto FPGA                  |
| `clean`     | Remove all generated files                     |

---

## 📌 Notes
- Check the `.pcf` file to ensure correct FPGA pin mapping.
- Simulation waveform (`top_tb.vcd`) verifies counter behavior.
- Verify `top.timings` for FPGA timing constraints compliance.

---

## 💻 Tools & Technologies Used
- **Yosys 0.47+** - Synthesis
- **NextPNR** - Place and Route
- **IceStorm / iceprog** - FPGA Programming
- **GTKWave** - Simulation waveform visualization

---

## 🌟 Future Improvements
- Add enable input for counter control
- Add parameterization to change counter width easily
- Extend testbench for random reset and boundary tests

---

## 📖 References
- [Yosys](https://yosyshq.net/yosys/)
- [NextPNR](https://github.com/YosysHQ/nextpnr)
- [Project IceStorm](https://clifford.at/icestorm/)

---

## 🌐 Author & Contact
**Author:** Gowtham.T 
**Email:**  gowthamthangaraj18@gmail.com

---

Let me know if you'd like example simulation waveforms or hardware setup diagrams added!

