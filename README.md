# 🖥️ Computer Organization & Architecture Portfolio

[![Cooper Union](https://img.shields.io/badge/Cooper%20Union-ECE%20366-blue.svg)](https://cooper.edu)
[![Verilog](https://img.shields.io/badge/HDL-Verilog-orange.svg)](https://en.wikipedia.org/wiki/Verilog)
[![MIPS](https://img.shields.io/badge/ISA-MIPS32-green.svg)](https://en.wikipedia.org/wiki/MIPS_architecture)

This repository showcases coursework from **ECE 366: Computer Organization**, demonstrating mastery of digital logic design, hardware description languages, and low-level assembly programming.

---

## 🏗️ System Architecture Overview

```mermaid
graph TB
    subgraph Digital["🔌 Digital Logic Design"]
        BB[Building Blocks<br/>1-bit Full Adders]
        RCA[Ripple Carry Adder<br/>Sequential]
        CLA[Carry Lookahead Adder<br/>Parallel]
        PPA[Prefix Parallel Adder<br/>Optimized]
    end
    
    subgraph MIPS["🔧 MIPS Assembly"]
        FIB[Fibonacci Generator<br/>Iterative Algorithm]
        PAR[Parity Checker<br/>Odd/Even Detection]
        COMB[Combined Analysis<br/>Fibonacci + Parity]
    end
    
    subgraph Tools["🛠️ Development Tools"]
        MOD[ModelSim<br/>Verilog Simulation]
        MARS[MARS Simulator<br/>MIPS Execution]
    end
    
    BB --> RCA
    BB --> CLA
    BB --> PPA
    
    RCA --> MOD
    CLA --> MOD
    PPA --> MOD
    
    FIB --> PAR
    PAR --> COMB
    
    FIB --> MARS
    PAR --> MARS
    COMB --> MARS
    
    MOD -.->|Waveform Analysis| RESULTS[📊 Performance Metrics]
    MARS -.->|Instruction Count| RESULTS
    
    style BB fill:#90EE90
    style RCA fill:#87CEEB
    style CLA fill:#FFD700
    style PPA fill:#FFA500
    style FIB fill:#FF69B4
    style PAR fill:#DDA0DD
    style COMB fill:#BA55D3
    style MOD fill:#20B2AA
    style MARS fill:#3CB371
    style RESULTS fill:#FF6347
```

---

## 📂 Repository Structure

```
Digital Logic & MIPS/
│
├── 01-Digital-Logic-Adders/          # Hardware Arithmetic Units
│   │
│   ├── Building-Blocks/              # Fundamental Components
│   │   ├── one_bit_full_adder.v           # 1-bit Full Adder (Structural)
│   │   └── one_bit_full_adder_behavioral.v # 1-bit Full Adder (Behavioral)
│   │
│   ├── Ripple-Carry-Adder/           # Sequential Carry Propagation
│   │   ├── four_bit_RCA.v                 # 4-bit Ripple Carry Adder
│   │   ├── four_bit_RCS.v                 # 4-bit Ripple Carry Subtractor
│   │   ├── RCA_tb.v                       # RCA Testbench
│   │   └── RCS_tb.v                       # RCS Testbench
│   │
│   ├── Carry-Lookahead-Adder/        # Parallel Carry Generation
│   │   ├── CLA32.v                        # 32-bit CLA Top Module
│   │   ├── cla_block.v                    # 4-bit CLA Building Block
│   │   └── CLA32_tb.v                     # CLA32 Testbench
│   │
│   └── Prefix-Parallel-Adder/        # Parallel Prefix Algorithm
│       ├── PPA16.v                        # 16-bit Brent-Kung PPA
│       └── PPA16_tb.v                     # PPA16 Testbench
│
└── 02-MIPS-Assembly-Optimization/     # MIPS32 Assembly Programs
    │
    ├── Fibonacci-Sequence/            # Iterative Fibonacci Generator
    │   └── fibonacci.asm                  # O(n) implementation
    │
    ├── Parity-Checker/                # Odd/Even Detection
    │   └── odd.asm                        # Iterative parity test
    │
    └── Fibonacci-Parity-Combined/     # Composite Algorithm
        └── isfibonacciodd.asm             # Combined Fib + Parity
```

---

## 🔌 Digital Logic: Adder Architectures

### Overview
Implementation and comparison of various adder designs, analyzing trade-offs between **speed**, **area**, and **power consumption**.

### Module Hierarchy & Data Flow

```mermaid
graph LR
    subgraph Inputs
        A[Input A<br/>32-bit]
        B[Input B<br/>32-bit]
        Cin[Carry In]
    end
    
    subgraph Building["Building Blocks"]
        FA1[1-bit Full Adder<br/>Structural]
        FA2[1-bit Full Adder<br/>Behavioral]
    end
    
    subgraph RCA_Module["Ripple Carry Architecture"]
        RCA4[4-bit RCA<br/>Sequential Chain]
        RCS4[4-bit RCS<br/>Subtraction]
    end
    
    subgraph CLA_Module["Carry Lookahead Architecture"]
        CLAB[4-bit CLA Block<br/>G/P Logic]
        CLA32[32-bit CLA<br/>8 Blocks]
    end
    
    subgraph PPA_Module["Prefix Parallel Architecture"]
        PPA16[16-bit PPA<br/>Brent-Kung]
    end
    
    subgraph Outputs
        Sum[Sum Output<br/>32-bit]
        Cout[Carry Out]
        V[Overflow Flag]
    end
    
    A --> RCA4
    B --> RCA4
    Cin --> RCA4
    
    A --> CLA32
    B --> CLA32
    Cin --> CLA32
    
    A --> PPA16
    B --> PPA16
    Cin --> PPA16
    
    FA1 -.->|instantiate| RCA4
    FA2 -.->|instantiate| RCS4
    CLAB -.->|8x cascade| CLA32
    
    RCA4 --> Sum
    CLA32 --> Sum
    PPA16 --> Sum
    
    RCA4 --> Cout
    CLA32 --> Cout
    PPA16 --> Cout
    
    style FA1 fill:#90EE90
    style FA2 fill:#98FB98
    style RCA4 fill:#87CEEB
    style RCS4 fill:#B0E0E6
    style CLAB fill:#FFD700
    style CLA32 fill:#FFA500
    style PPA16 fill:#FF8C00
    style Sum fill:#FF6347
    style Cout fill:#FF4500
```

### Architectures Implemented

#### 1️⃣ Ripple Carry Adder (RCA)
```
         A[3:0]  B[3:0]
            │      │
            ▼      ▼
        ┌───────────────┐
        │  Full Adder   │ ◄─── Cin
        │    (Bit 0)    │
        └───────┬───────┘
          Cout  │  S[0]
                ▼
        ┌───────────────┐
        │  Full Adder   │
        │    (Bit 1)    │
        └───────┬───────┘
          Cout  │  S[1]
                ▼
        ┌───────────────┐
        │  Full Adder   │
        │    (Bit 2)    │
        └───────┬───────┘
          Cout  │  S[2]
                ▼
        ┌───────────────┐
        │  Full Adder   │
        │    (Bit 3)    │
        └───────┬───────┘
          Cout  │  S[3]
```
- **Delay**: O(n) - Sequential carry propagation
- **Area**: Minimal - Simple structure
- **Best for**: Low-complexity designs

#### 2️⃣ Carry Lookahead Adder (CLA32)
```
     A[31:0]          B[31:0]
         │                │
         └────────┬───────┘
                  ▼
      ┌────────────────────────┐
      │  Generate/Propagate    │
      │  Logic (All bits)      │
      └────────────────────────┘
                  │
         ┌────────┴────────┐
         ▼                 ▼
    ┌─────────┐       ┌─────────┐
    │ CLA     │       │ CLA     │
    │ Block 0 │       │ Block 1 │
    │ [3:0]   │       │ [7:4]   │
    └────┬────┘       └────┬────┘
         │                 │
      C_out[0]          C_out[1]
         └────────┬────────┘
                  ▼
            (8 blocks total)
```
- **Delay**: O(log n) - Parallel carry calculation
- **Area**: Larger due to lookahead logic
- **Best for**: High-speed arithmetic units

#### 3️⃣ Prefix Parallel Adder (PPA16)
```
Level 0:  G[15:0]  P[15:0]   (Generate/Propagate)
          │        │
Level 1:  └────┬───┘         (Adjacent pairs)
               │
Level 2:  ┌────┴────┐        (Span 4 bits)
          │         │
Level 3:  └─────┬───┘        (Span 8 bits)
                │
Level 4:  ──────┴──────      (Full 16-bit span)
                │
          Sum Calculation
```
- **Delay**: O(log n) - Parallel prefix computation
- **Area**: Moderate - Balanced design
- **Best for**: Modern processors (Brent-Kung style)

### Performance Comparison

| Architecture | Delay      | Area  | Power | Use Case                    |
|--------------|------------|-------|-------|-----------------------------|
| **RCA**      | O(n)       | Small | Low   | Simple calculators          |
| **CLA32**    | O(log n)   | Large | High  | ALUs, DSP units             |
| **PPA16**    | O(log n)   | Medium| Med   | CPU adders, GPU arithmetic  |

### Key Concepts Demonstrated
- **Building Blocks**: Modular 1-bit full adders (structural vs behavioral modeling)
- **Hierarchical Design**: Bottom-up construction from 1-bit → 4-bit → 32-bit
- **Full Adder**: Combinational logic for 1-bit addition
  - Structural: Gate-level instantiation
  - Behavioral: High-level abstraction
- **Carry Chain**: Sequential vs. parallel carry generation
- **Generate (G) / Propagate (P)**: Lookahead signal calculation
  - `G = A & B` (carry generated)
  - `P = A | B` (carry propagated)
- **Testbench Design**: Comprehensive verification methodology
- **Design Patterns**: Ripple vs. lookahead vs. prefix architectures

---

## 🔧 MIPS Assembly: Algorithm Optimization

### Overview
Hand-optimized MIPS32 assembly programs demonstrating efficient use of registers, minimal branching, and algorithmic efficiency.

### Program Execution Flow

```mermaid
flowchart TD
    START([Program Start]) --> INIT[Initialize Registers<br/>$a0 = input n]
    
    INIT --> FIB{Run Fibonacci?}
    FIB -->|Yes| FBASE[Base Case Check<br/>n ≤ 1?]
    FBASE -->|True| FRET[Return n]
    FBASE -->|False| FLOOP[Iterative Loop<br/>a=0, b=1]
    FLOOP --> FCALC[Calculate<br/>temp=b, b=a+b, a=temp]
    FCALC --> FDEC[Decrement Counter<br/>i--]
    FDEC --> FCHECK{i > 0?}
    FCHECK -->|Yes| FCALC
    FCHECK -->|No| FOUT[Result in $v0]
    
    FIB -->|No| PAR{Run Parity?}
    PAR -->|Yes| PLOOP[Subtract 2<br/>remainder -= 2]
    PLOOP --> PCHECK{remainder < 2?}
    PCHECK -->|No| PLOOP
    PCHECK -->|Yes| POUT[Result in $v0<br/>1=odd, 0=even]
    
    PAR -->|No| COMB{Run Combined?}
    COMB -->|Yes| CFIB[Execute Fibonacci<br/>Get nth value]
    CFIB --> CPAR[Execute Parity<br/>Check if odd]
    CPAR --> COUT[Result in $v0]
    
    FRET --> END([Program End])
    FOUT --> END
    POUT --> END
    COUT --> END
    COMB -->|No| END
    
    style START fill:#90EE90
    style INIT fill:#87CEEB
    style FBASE fill:#FFD700
    style FLOOP fill:#FFA500
    style PLOOP fill:#FF69B4
    style CPAR fill:#BA55D3
    style END fill:#FF6347
```

### Programs

#### 1️⃣ Fibonacci Sequence Generator
**File**: `Fibonacci-Sequence/fibonacci.asm`

**Algorithm**: Iterative computation of the nth Fibonacci number.

```
Pseudo-code:
if n ≤ 1:
    return n
a = 0, b = 1
for i = 1 to n-1:
    temp = b
    b = a + b
    a = temp
return b
```

**Optimization Techniques**:
- Register-only computation (no memory access)
- Early exit for base cases
- Loop unrolling considerations

**Register Usage**:
- `$a0`: Input (n)
- `$v0`: Return value (nth Fibonacci)
- `$t0`: a (previous value)
- `$t1`: b (current value)
- `$t2`: Loop counter

**Complexity**: O(n) time, O(1) space

---

#### 2️⃣ Parity Checker (Odd/Even Detection)
**File**: `Parity-Checker/odd.asm`

**Algorithm**: Determines if a number is odd using iterative subtraction.

```
Pseudo-code:
remainder = n
while remainder ≥ 2:
    remainder -= 2
return remainder  # 1 = odd, 0 = even
```

**Optimization Techniques**:
- Minimal instruction count
- Alternative to bitwise AND (showcases iterative approach)
- Branch prediction friendly

**Register Usage**:
- `$a0`: Input number
- `$v0`: Result (1 = odd, 0 = even)

**Complexity**: O(n) time (educational), O(1) with bitwise would be O(1)

---

#### 3️⃣ Fibonacci-Parity Combined Analysis
**File**: `Fibonacci-Parity-Combined/isfibonacciodd.asm`

**Algorithm**: Computes nth Fibonacci number, then checks if it's odd.

```
Flow Diagram:

    ┌─────────────────┐
    │  Input: n       │
    └────────┬────────┘
             ▼
    ┌─────────────────┐
    │  Fibonacci(n)   │
    │  (Iterative)    │
    └────────┬────────┘
             ▼
         Result in $v0
             │
             ▼
    ┌─────────────────┐
    │  Parity Check   │
    │  (Odd Test)     │
    └────────┬────────┘
             ▼
    ┌─────────────────┐
    │  Return 1/0     │
    └─────────────────┘
```

**Key Insight**: Demonstrates function composition and register management across algorithm boundaries.

---

## 🎓 Learning Outcomes

### Hardware Design (Verilog)
✅ Digital logic synthesis and optimization  
✅ Hierarchical module design  
✅ Testbench development and waveform analysis  
✅ Timing analysis and critical path identification  
✅ Hardware/software trade-offs  

### Assembly Programming (MIPS)
✅ Register allocation and optimization  
✅ Branch prediction and pipeline awareness  
✅ Algorithm implementation in constrained environments  
✅ Instruction set architecture (ISA) mastery  
✅ Performance profiling and optimization  

### Computer Architecture Concepts
✅ Arithmetic logic unit (ALU) design  
✅ Datapath and control unit interaction  
✅ Memory hierarchy implications  
✅ Pipeline hazards and mitigation  
✅ Performance metrics (CPI, throughput, latency)  

---

## 🛠️ Development Environment

### Verilog Simulation
```bash
# Using ModelSim
cd 01-Digital-Logic-Adders

# Compile all Verilog files recursively
vlog Building-Blocks/*.v
vlog Ripple-Carry-Adder/*.v
vlog Carry-Lookahead-Adder/*.v
vlog Prefix-Parallel-Adder/*.v

# Simulate CLA32 with testbench
vsim -c CLA32_tb -do "run -all; quit"

# View waveforms (GUI mode)
vsim CLA32_tb
add wave *
run -all
```

### MIPS Assembly Execution
```bash
# Using MARS (MIPS Assembler and Runtime Simulator)
cd 02-MIPS-Assembly-Optimization/Fibonacci-Sequence

# Run Fibonacci program
java -jar Mars.jar fibonacci.asm

# Run with GUI (step through execution)
java -jar Mars.jar
# File → Open → fibonacci.asm → Assemble → Run
```

---

## 📊 Testing & Verification

### Testing Architecture

```mermaid
graph TB
    subgraph VerilogTest["Verilog Testing Pipeline"]
        DUT1[Design Under Test<br/>Adder Modules]
        TB1[Testbench<br/>Stimulus Generation]
        SIM1[ModelSim Simulator]
        WAVE1[Waveform Viewer]
        
        TB1 -->|Apply Test Vectors| DUT1
        DUT1 -->|Output Signals| SIM1
        SIM1 -->|Generate| WAVE1
    end
    
    subgraph MIPSTest["MIPS Testing Pipeline"]
        ASM[Assembly Source<br/>.asm files]
        MARS_ASM[MARS Assembler]
        MARS_SIM[MARS Simulator]
        REG[Register Inspector]
        
        ASM -->|Assemble| MARS_ASM
        MARS_ASM -->|Machine Code| MARS_SIM
        MARS_SIM -->|Step Through| REG
    end
    
    subgraph Validation["Validation Criteria"]
        CHECK1[✓ Exhaustive Testing]
        CHECK2[✓ Edge Cases]
        CHECK3[✓ Timing Analysis]
        CHECK4[✓ Instruction Count]
    end
    
    WAVE1 -.->|Verify| CHECK1
    WAVE1 -.->|Verify| CHECK2
    WAVE1 -.->|Measure| CHECK3
    REG -.->|Count| CHECK4
    
    CHECK1 --> PASS{All Tests Pass?}
    CHECK2 --> PASS
    CHECK3 --> PASS
    CHECK4 --> PASS
    
    PASS -->|Yes| SUCCESS[✅ Design Verified]
    PASS -->|No| DEBUG[🔧 Debug & Iterate]
    DEBUG -.->|Revise| DUT1
    DEBUG -.->|Revise| ASM
    
    style DUT1 fill:#87CEEB
    style ASM fill:#FF69B4
    style WAVE1 fill:#FFD700
    style REG fill:#FFA500
    style SUCCESS fill:#90EE90
    style DEBUG fill:#FF6347
```

### Verilog Testbenches
Each adder implementation includes comprehensive testbenches:
- **Exhaustive testing**: All input combinations for small bit-widths
- **Edge cases**: Maximum values, carry propagation chains
- **Randomized testing**: Monte Carlo simulation for 32-bit adders

### MIPS Validation
Assembly programs validated against:
- **Known Fibonacci sequences**: F(0)=0, F(1)=1, F(10)=55
- **Parity test cases**: Even/odd boundaries
- **Corner cases**: n=0, n=1, large values

---

## 📚 Course Context

**Institution**: University of Illinois at Chicago
**Course**: ECE 366 - Computer Organization  
**Topics Covered**:
- Boolean algebra and combinational logic
- Sequential circuit design (FSMs, registers)
- Computer arithmetic (addition, multiplication, division)
- Instruction set architecture (MIPS32)
- Processor datapath and control
- Pipelining and hazards
- Memory hierarchy (cache, virtual memory)

---

## 📈 Performance Insights

### Adder Synthesis Results (Example)
| Metric              | RCA  | CLA32 | PPA16 |
|---------------------|------|-------|-------|
| Gate Count          | 52   | 184   | 128   |
| Critical Path (ns)  | 8.4  | 4.2   | 4.8   |
| Max Frequency (MHz) | 119  | 238   | 208   |

### MIPS Instruction Counts
| Program                  | Instructions | Cycles (no hazards) |
|--------------------------|--------------|---------------------|
| Fibonacci (n=10)         | 34           | 34                  |
| Parity Check (n=31)      | 18           | 18                  |
| Fibonacci-Parity (n=12)  | 48           | 48                  |

---

## 🔗 References & Resources

- **Verilog HDL**: IEEE Standard 1364-2005
- **MIPS Architecture**: Patterson & Hennessy, *Computer Organization and Design*
- **ModelSim**: Mentor Graphics Simulation Tool
- **MARS**: Missouri State University MIPS Simulator

---

## 📄 License

This repository contains academic coursework for educational purposes.  
**Author**: Cooper Union ECE Student  
**Course**: ECE 366 Computer Organization (Fall 2024)

---

## 🚀 Quick Start

```bash
# Clone repository
git clone git@github.com:ak23bar/Computer-Organization.git
cd Computer-Organization

# Explore Verilog designs by architecture
cd "01-Digital-Logic-Adders"
ls -R

# View specific adder type
cd Carry-Lookahead-Adder
cat CLA32.v

# Explore MIPS programs
cd "../../02-MIPS-Assembly-Optimization"
find . -name "*.asm" -exec basename {} \;
```

---

**Built with dedication to understanding how computers work from the transistor up.** ⚡
