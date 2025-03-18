
# UART Communication Project - FPGA Implementation

## 📂 Project Description

This project implements a UART (Universal Asynchronous Receiver/Transmitter) communication system on an FPGA. It contains Verilog modules for:

- UART Baud Rate Generator
- UART Receiver (RX)
- UART Transmitter (TX)

The project is designed to be synthesized using Yosys and targeted for FPGA boards.

---

## 🗂 Project Structure

```
├── Makefile                  # Automation script for synthesis and simulation
├── TOP.v                     # Top-level Verilog module
├── UART_baudrate_generator.v # Baud rate generation module
├── UART_rx.v                 # UART receiver module
├── UART_tx.v                 # UART transmitter module
├── VSDSquadronFM.pcf         # FPGA constraints file
├── TOP.asc                   # Place and route result
├── TOP.bin                   # FPGA bitstream
├── TOP.timings               # Timing report
├── TOP.json                  # Yosys synthesized netlist (JSON format)
```

---

## ⚙️ Requirements

- Yosys for synthesis
- NextPNR for placement and routing (if targeting Lattice ICE40)
- FPGA toolchain compatible with `.pcf` and `.bin` (e.g., ICE40 toolchain)
- Verilog Simulator (e.g., Icarus Verilog or ModelSim)

---

## 🚀 How to Build and Run

1. **Synthesis and Place & Route**

   ```make 
   make pnr
   ```

2. **Generate Bitstream**

   ```make build
   make bit
   ```

3. **Programming FPGA**

   ```sudo make flash
    TOP.bin
   ```

---

## 🛡️ UART Features

- **Baud Rate Configurable**
- **8N1 Data Format** (8 Data Bits, No Parity, 1 Stop Bit)
- **Reliable Data Transmission and Reception**

---

## 🧠 Files Description

| File                        | Description                                             |
| --------------------------- | ------------------------------------------------------- |
| `UART_baudrate_generator.v` | Generates clock for desired baud rate.                  |
| `UART_rx.v`                 | Receives serial data, handles framing.                  |
| `UART_tx.v`                 | Transmits data serially.                                |
| `TOP.v`                     | Integrates TX, RX, and Baud generator.                  |
| `VSDSquadronFM.pcf`         | FPGA pin constraints for mapping.                       |
| `TOP.asc`, `TOP.bin`        | Outputs after place and route and bitstream generation. |
| `TOP.timings`               | Timing analysis report.                                 |
| `TOP.json`                  | Yosys netlist dump in JSON format.                      |

---

## 🔧 Makefile Targets

| Target  | Description                   |
| ------- | ----------------------------- |
| `synth` | Run Yosys synthesis           |
| `pnr`   | Run place & route             |
| `bit`   | Generate FPGA bitstream       |
| `sim`   | Run simulation (if supported) |
| `clean` | Clean build artifacts         |

---

## 📌 Notes

- Ensure you connect the UART TX and RX pins as per the `.pcf` constraints.
- Baud rate must be matched with the host PC terminal for proper communication.
- Timing analysis (`TOP.timings`) should be verified for FPGA clock constraints.

---

## 💻 Author / Tools

- **Synthesized with:** Yosys 0.47+
- **Place & Route:** nextpnr
- **Target FPGA:** ICE40 (modifiable)

---

Let me know if you need simulation waveforms, hardware connection guide, or additional features added!

