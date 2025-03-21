
# 🚀 VSDSquadron FPGA Mini (FM) - FSM FPGA Design Flow

This document provides an overview of the **VSDSquadron FPGA Mini (FM)** board and details the usage of essential commands in the FSM (Finite State Machine) FPGA design flow.

---

## 📋 Table of Contents

- [Board Overview](#board-overview)
- [Specifications](#specifications)
- [Command Breakdown](#command-breakdown)
  - [`make`](#1️⃣-make)
  - [`make build`](#2️⃣-make-build)
  - [`sudo make flash`](#3️⃣-sudo-make-flash)
- [Example Makefile Snippet](#example-makefile-snippet)
- [Full Workflow Example](#full-workflow-example)
- [Notes](#notes)
- [Tools Typically Used](#tools-typically-used)
- [Summary](#summary)
- [Getting Started](#getting-started)
- [Documentation and Support](#documentation-and-support)

---

## Board Overview

The **VSDSquadron FPGA Mini (FM)** is a compact and cost-effective development board designed for FPGA prototyping and embedded system projects. It offers a seamless hardware development experience with an integrated programmer, versatile GPIO access, and onboard memory, making it ideal for students, hobbyists, and developers exploring FPGA-based designs.

---

## Specifications

- **FPGA Chip:** Lattice UltraPlus ICE40UP5K
  - Logic Cells: 5,280
  - SPRAM: 1Mb
  - DPRAM: 120Kb
  - Multipliers: 8

- **Connectivity:** FTDI FT232H USB-to-SPI for programming and communication

- **GPIO:** 32 accessible FPGA GPIOs

- **Memory:** 4MB SPI flash for data storage and configuration

- **LED Indicators:** RGB LED for status indication

- **Power Regulation:** Onboard 3.3V and 1.2V regulators with external supply option

- **Dimensions:** 57mm x 29mm

*For more detailed specifications, refer to the [VSDSquadron FM Datasheet](https://www.vlsisystemdesign.com/wp-content/uploads/2025/01/VSDSquadronFMDatasheet.pdf).*

---

## Command Breakdown

### 1️⃣ `make`

**Purpose:**  
Compiles the Verilog design files.

**What Happens:**  
- Runs synthesis and simulation tasks.
- Generates intermediate files like `.json`, `.vvp`, or `.bin`.

**Usage:**
```bash
make
```

---

### 2️⃣ `make build`

**Purpose:**  
Builds the design and prepares the FPGA bitstream.

**What Happens:**  
- Maps the synthesized design to FPGA constraints.
- Generates the final FPGA-ready binary or bitstream (e.g., `top.bin` or `top.bit`).

**Usage:**
```bash
make build
```

---

### 3️⃣ `sudo make flash`

**Purpose:**  
Flashes (uploads) the generated bitstream or binary to the FPGA hardware.

**Why `sudo`?**  
- Flashing often requires USB/JTAG access, needing root permissions.

**Usage:**
```bash
sudo make flash
```

---

## Example Makefile Snippet

```makefile
build:
    yosys -p "synth_ice40 -top top -json top.json" top.v
    nextpnr-ice40 --hx8k --json top.json --asc top.asc
    icepack top.asc top.bin

flash:
    iceprog top.bin
```

---

## Full Workflow Example

```bash
make            # Synthesize and simulate the Verilog FSM
make build      # Generate bitstream for FPGA
sudo make flash # Flash the bitstream onto the FPGA board
```

---

## Notes

- Toolchains and flashing commands might vary based on your FPGA board (e.g., iCEBreaker, Arty).
- Replace `iceprog` with `openFPGALoader` or `vivado` for other FPGA platforms.
- Always check hardware permissions; `sudo` may be required for flashing.

---

## Tools Typically Used

- **Yosys:** Synthesis
- **NextPNR:** Place & Route
- **icepack / Vivado / openFPGALoader:** Bitstream generation
- **iceprog / openFPGALoader:** Flashing to FPGA hardware

---

## Summary

| Command           | Description                             |
|-------------------|-----------------------------------------|
| `make`            | Compile and synthesize Verilog code     |
| `make build`      | Generate FPGA-ready bitstream           |
| `sudo make flash` | Upload bitstream to the FPGA hardware   |

---

## Getting Started

- **Software Tools Required:** Project Icestorm, Yosys, NextPNR
- **Programming:** Onboard FTDI FT232H enables USB-based programming.
- **First Project:** A preloaded "blink LED" example is included for quick testing.

---

## Documentation and Support

- **Datasheet:** [VSDSquadron FM Datasheet](https://www.vlsisystemdesign.com/wp-content/uploads/2025/01/VSDSquadronFMDatasheet.pdf)
- **Online Support:** VSD Slack Channel
- **Contact:** vsd@vlsisystemdesign.com

---

## ✨ Happy FPGA Designing! ✨









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
