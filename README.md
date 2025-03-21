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
VSD Squadron - FSM FPGA Design Flow 🚀
This document explains the usage of the following commands commonly used in the VSD Squadron FSM (Finite State Machine) FPGA Design flow:

- make
- make build
- sudo make flash

These commands automate synthesis, bitstream generation, and FPGA programming steps using tools like Yosys, NextPNR, and iceprog (or similar FPGA loaders).
🔨 Command Breakdown
1️⃣ make
Purpose:
Compiles the Verilog design files.

What Happens:
- Runs synthesis and simulation tasks.
- Generates intermediate files like .json, .vvp, or .bin.

Example Usage:
make
2️⃣ make build
Purpose:
Specifically builds the design and prepares the FPGA bitstream.

What Happens:
- Maps the synthesized design to FPGA constraints.
- Generates the final FPGA-ready binary or bitstream (top.bin or top.bit).

Example Usage:
make build
3️⃣ sudo make flash
Purpose:
Flashes (uploads) the generated bitstream or binary to the FPGA hardware.

Why sudo?
- Flashing typically requires USB or JTAG access, needing root permissions.

Example Usage:
sudo make flash
✅ Example Makefile Target Snippet
build:
    yosys -p "synth_ice40 -top top -json top.json" top.v
    nextpnr-ice40 --hx8k --json top.json --asc top.asc
    icepack top.asc top.bin

flash:
    iceprog top.bin
Full Flow Example:
make           # Synthesize and simulate the Verilog FSM
make build     # Generate bitstream for FPGA
sudo make flash  # Flash the bitstream onto the FPGA board
🧠 Notes:
- The exact tools and commands may vary based on the FPGA board (iCEBreaker, Arty, etc.).
- Replace iceprog with openFPGALoader or vivado for boards like Lattice or Xilinx.
- Ensure your user has the required permissions or use sudo for flashing.
🔗 Tools Typically Used:
- Yosys: Synthesis
- NextPNR: Place & Route
- icepack / Vivado / openFPGALoader: Bitstream generation
- iceprog / openFPGALoader: Flashing to FPGA
📌 Summary:
Command	Description
make	Compile and synthesize Verilog code
make build	Generate FPGA-ready bitstream
sudo make flash	Upload bitstream to the FPGA hardware

Happy FPGA Designing! ✨

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
