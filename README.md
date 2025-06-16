# Tiny Processor in Verilog

A simple 8-bit processor implemented in Verilog HDL as a course project by **Praneel Joshi (23110254)** and **Samarth Sonawane (23110317)**. This processor supports basic arithmetic, logic, shift, memory, and control operations using a minimal modular design.

---

## Project Structure
- ALU.v # Arithmetic Logic Unit 
- acc.v # Accumulator register wrapper
- control_unit.v # FSM-based control logic for executing instructions
- ext.v # (Not provided, assumed to be a signal extender or decoder)
- instructions.v # ROM for instruction memory (two versions)
- program_counter.v # 5-bit PC to track instruction address
- register.v # Parameterized 8-bit register
- register_bank.v # 16-register general purpose register bank
- sim.v # Top-level simulation testbench

---
## Figures of Implementation
### Individual Register



---

## Processor Architecture

This processor consists of the following main components:

### ALU (`ALU.v`)
- Handles arithmetic (ADD, SUB, MUL), logic (AND, XOR), shifts, rotates, INC/DEC, and comparison.
- Uses opcode's top 4 bits (`x`) to select operation type and bottom 4 bits (`y`) to refine the operation.
- Overflow and carry bit handling included for arithmetic operations.

### Register Bank (`register_bank.v`)
- 16 general purpose 8-bit registers.
- Supports read/write via address lines and individual enable lines.
- Interfaced with ALU and ACC for instruction execution.

### Accumulator (`acc.v`)
- Central 8-bit register used in arithmetic and logic operations.
- Updated via ALU outputs or register bank data.

### Program Counter (`program_counter.v`)
- 5-bit counter for instruction address.
- Increments conditionally based on control signals.
- Resets on `HALT` instruction.

### Control Unit (`control_unit.v`)
- Finite state machine (FSM) with `EXE` and `WRITE` states.
- Fetches instructions, decodes them, triggers ALU/RegisterBank/ACC operations.
- Handles termination via opcode `11111111` (HALT).

### Instruction Memory (`instructions.v`)
- Contains predefined instruction set using 8-bit opcodes.
- Two versions provided:
  - Full ISA version
  - Sample test program version

---

## Supported Instructions

Instruction format: `XXXXYYYY`

- **X (4-bit opcode class)**: operation type
- **Y (4-bit operand)**: register index or ALU subcode

Example Instructions:
- `1001XXXX` – Move register to ACC
- `0001YYYY` – ADD ACC with register Y
- `0010YYYY` – SUB ACC with register Y
- `0011YYYY` – MUL ACC with register Y
- `00000001` – Left Shift ACC
- `0111YYYY` – CMP ACC with register Y
- `1010YYYY` – Move ACC to register Y
- `11111111` – HALT

---

## Simulation

To simulate the processor:

1. Load `sim.v` as the top module.
2. Observe instruction fetch, ALU execution, ACC update, and register bank operations.
3. Simulate in tools like ModelSim, Vivado, or GTKWave.

---

## Authors

- **Praneel Joshi** – 23110254  
- **Samarth Sonawane** – 23110317  

---

## License

This project is intended for academic use and learning purposes. Feel free to fork, experiment, and build on it.

---

## Future Work

- Implement branching and jump instructions.
- Add stack support with push/pop.
- Create a pipelined version.
- Interface with external memory or I/O.

---
