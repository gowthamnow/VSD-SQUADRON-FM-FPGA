# FPGA Projects Repository - UART and 8-bit Counter

## 📂 Repository Overview
This repository contains two FPGA-based digital design projects developed using Verilog HDL, fully verified with simulation, synthesis, and FPGA implementation flow. Both projects follow open-source FPGA tools for synthesis and bitstream generation.

---

## 🏦 Project Folders
### 1. **UART Communication System**
- **Folder:** `uart/`
- **Description:** Implements a UART (Universal Asynchronous Receiver/Transmitter) module for serial communication.
- **Features:**
  - Configurable Baud Rate
  - 8N1 Frame Format (8 Data Bits, No Parity, 1 Stop Bit)
  - Verilog RTL, Testbench, Synthesis, and Bitstream Generation

### 2. **8-bit Synchronous Counter**
- **Folder:** `8bit_counter/`
- **Description:** Implements a synchronous 8-bit counter that counts from 0 to 255.
- **Features:**
  - Synchronous counting
  - Reset functionality
  - Verilog RTL, Testbench, Simulation waveforms, and Synthesis-ready

---

## ⚙️ Tools & Requirements (For Both Projects)
- **Yosys** - Synthesis
- **NextPNR** - Place and Route
- **IceStorm / iceprog** - Bitstream Generation and FPGA Programming
- **GTKWave** - Waveform viewing (for testbench results)
- **Icarus Verilog / ModelSim** - Simulation
- **Target FPGA:** Lattice ICE40 or compatible board

---

## 🚀 General Build Instructions
### For UART Project:
```bash
cd uart
make pnr
make build
make sim   # Optional Simulation
sudo make flash
```

### For 8-bit Counter Project:
```bash
cd 8bit_counter
make pnr
make build
make sim   # Optional Simulation
sudo make flash
```

---

## 🔧 Repository Structure
```
├── uart/               # Complete UART Project
│   ├── TOP.v
│   ├── UART_tx.v
│   ├── UART_rx.v
│   ├── UART_baudrate_generator.v
│   ├── TOP.json / .asc / .bin / .timings
│   ├── Makefile
│   └── VSDSquadronFM.pcf
│
├── 8bit_counter/       # Complete 8-bit Counter Project
│   ├── top.v
│   ├── top_tb.v
│   ├── top.json / .asc / .bin / .timings
│   ├── top_tb.vcd
│   ├── Makefile
│   └── VSDSquadronFM.pcf
│
└── README.md            # Main repository README
```

---

## 📌 Notes
- Each project has its own `Makefile` supporting synthesis, simulation, and FPGA flashing.
- Ensure correct `.pcf` pin constraints while mapping the FPGA I/O pins.
- Both projects are tested with waveforms (`VCD`) and bitstream generation.

---

## 💻 Technologies Used
- **Yosys 0.47+**
- **NextPNR**
- **Project IceStorm Toolchain**
- **GTKWave**

---

## 📚 Learning Outcomes
- Understanding of FPGA design flow
- UART protocol implementation
- Synchronous counter design
- Hands-on experience with simulation, synthesis, and hardware programming

---

## 🌟 Authors / Contribution
**Developer:** Gowtham.T 
**Email:** gowthamthangaraj18@gmail.com  

Feel free to fork, modify, and contribute to the repository!

---

## 🌐 References
- [Yosys Synthesis Suite](https://yosyshq.net/yosys/)
- [NextPNR Documentation](https://github.com/YosysHQ/nextpnr)
- [Project IceStorm](https://clifford.at/icestorm/)
