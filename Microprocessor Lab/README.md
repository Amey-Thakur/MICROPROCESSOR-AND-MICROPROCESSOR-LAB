<!-- =========================================================================================
                                     HEADER SECTION
     ========================================================================================= -->
<div align="center">

  # Microprocessor Lab

  ### CSL501 · Semester V · Computer Engineering

  [![Curated by](https://img.shields.io/badge/Curated%20by-Amey%20Thakur-blue.svg)](https://github.com/Amey-Thakur)
  [![Programs](https://img.shields.io/badge/Programs-28-yellowgreen.svg)](#laboratory-experiments)
  [![Language](https://img.shields.io/badge/Language-Assembly%20%7C%20C-blueviolet.svg)](./)

  **A comprehensive collection of 28 programs across 10 experiments covering Intel 8086 microprocessor programming including arithmetic operations, string handling, sorting algorithms, system interfacing, and mixed C/Assembly programming.**

  ---

  **[🔢 Experiment 1](#-experiment-1-basic-arithmetic-8-programs)** &nbsp;·&nbsp; **[🔄 Experiment 2](#-experiment-2-code-conversions-1-program)** &nbsp;·&nbsp; **[📝 Experiment 3](#-experiment-3-string-handling-1-program)** &nbsp;·&nbsp; **[📊 Experiment 4](#-experiment-4-sorting-algorithms-2-programs)** &nbsp;·&nbsp; **[🔍 Experiment 5](#-experiment-5-array-search-1-program)** &nbsp;·&nbsp; **[🕐 Experiment 6](#-experiment-6-system-interfacing-1-program)** &nbsp;·&nbsp; **[🧮 Experiment 7](#-experiment-7-mathematical-operations-1-program)** &nbsp;·&nbsp; **[📦 Experiment 8](#-experiment-8-macro-utilization-1-program)** &nbsp;·&nbsp; **[🔀 Experiment 9](#-experiment-9-array-splitter-1-program)** &nbsp;·&nbsp; **[⬅➡ Experiment 10](#-experiment-10-logical-shifting-1-program)** &nbsp;·&nbsp; **[🚀 How to Use](#-how-to-use)** &nbsp;·&nbsp; **[📖 Learning Path](#-learning-path)**

</div>

---

> [!TIP]
> **Additional Learning Resource**: For more 8086 assembly programs beyond these experiments, check out my [8086 Assembly Language Programs](https://github.com/Amey-Thakur/8086-ASSEMBLY-LANGUAGE-PROGRAMS) repository — 161 programs I developed during this course for self-learning, covering arithmetic, conversions, sorting, searching, and more.

> [!WARNING]
> **Register Safety**: In 8086 assembly, direct hardware manipulation requires careful register management. Always push/pop registers when using interrupts to prevent data corruption. Ensure your data segments (DS, ES) are correctly initialized at the start of every program to avoid runtime memory errors.

---

<!-- =========================================================================================
                                     EXPERIMENT 1
     ========================================================================================= -->
## 🔢 Experiment 1: Basic Arithmetic (8 Programs)

Implementation of fundamental arithmetic operations for 8-bit and 16-bit numbers.

| # | Program | Algorithm | Description |
|:---|:---|:---|:---|
| 1 | [Addition_Of_Two_8-bit_Numbers.asm](Experiment-1/Source%20Code/Addition_Of_Two_8-bit_Numbers.asm) | Addition | 8-bit addition with carry handling |
| 2 | [Addition_Of_Two_16-bit_Numbers.asm](Experiment-1/Source%20Code/Addition_Of_Two_16-bit_Numbers.asm) | Addition | 16-bit addition for larger values |
| 3 | [Subtraction_Of_Two_8-bit_Numbers.asm](Experiment-1/Source%20Code/Subtraction_Of_Two_8-bit_Numbers.asm) | Subtraction | 8-bit subtraction basics |
| 4 | [Subtraction_Of_Two_16-bit_Numbers.asm](Experiment-1/Source%20Code/Subtraction_Of_Two_16-bit_Numbers.asm) | Subtraction | 16-bit subtraction logic |
| 5 | [Multiplication_Of_Two_8-bit_Numbers.asm](Experiment-1/Source%20Code/Multiplication_Of_Two_8-bit_Numbers.asm) | Multiplication | 8-bit unsigned multiplication |
| 6 | [Multiplication_Of_Two_16-bit_Numbers.asm](Experiment-1/Source%20Code/Multiplication_Of_Two_16-bit_Numbers.asm) | Multiplication | 16-bit multiplication technique |
| 7 | [Division_Of_Two_8-bit_Numbers.asm](Experiment-1/Source%20Code/Division_Of_Two_8-bit_Numbers.asm) | Division | 8-bit division with quotient/remainder |
| 8 | [Division_Of_Two_16-bit_Numbers.asm](Experiment-1/Source%20Code/Division_Of_Two_16-bit_Numbers.asm) | Division | 16-bit division operations |

---

<!-- =========================================================================================
                                     EXPERIMENT 2
     ========================================================================================= -->
## 🔄 Experiment 2: Code Conversions (1 Program)

Converting data between different number systems (Binary, Decimal, Hexadecimal).

| # | Program | Algorithm | Description |
|:---|:---|:---|:---|
| 1 | [BCD_To_Binary_Conversion.asm](Experiment-2/Source%20Code/BCD_To_Binary_Conversion.asm) | Conversion | BCD to Binary conversion logic |

---

<!-- =========================================================================================
                                     EXPERIMENT 3
     ========================================================================================= -->
## 📝 Experiment 3: String Handling (1 Program)

String manipulation and character processing operations.

| # | Program | Algorithm | Description |
|:---|:---|:---|:---|
| 1 | [String_Manipulation.asm](Experiment-3/Source%20Code/String_Manipulation.asm) | String Ops | Length, copy, concatenate, compare |

---

<!-- =========================================================================================
                                     EXPERIMENT 4
     ========================================================================================= -->
## 📊 Experiment 4: Sorting Algorithms (2 Programs)

Implementation of classic sorting techniques for array organization.

| # | Program | Algorithm | Description |
|:---|:---|:---|:---|
| 1 | [Bubble_Sort.asm](Experiment-4/Source%20Code/Bubble_Sort.asm) | Bubble Sort | Ascending order sorting |
| 2 | [Selection_Sort.asm](Experiment-4/Source%20Code/Selection_Sort.asm) | Selection Sort | Minimum element selection |

---

<!-- =========================================================================================
                                     EXPERIMENT 5
     ========================================================================================= -->
## 🔍 Experiment 5: Array Search (1 Program)

Searching for specific elements within arrays.

| # | Program | Algorithm | Description |
|:---|:---|:---|:---|
| 1 | [Linear_Search.asm](Experiment-5/Source%20Code/Linear_Search.asm) | Linear Search | Sequential element search |

---

<!-- =========================================================================================
                                     EXPERIMENT 6
     ========================================================================================= -->
## 🕐 Experiment 6: System Interfacing (1 Program)

Interfacing with system hardware and BIOS interrupts.

| # | Program | Algorithm | Description |
|:---|:---|:---|:---|
| 1 | [Display_System_Time.asm](Experiment-6/Source%20Code/Display_System_Time.asm) | BIOS INT 21h | Real-time clock display |

---

<!-- =========================================================================================
                                     EXPERIMENT 7
     ========================================================================================= -->
## 🧮 Experiment 7: Mathematical Operations (1 Program)

Advanced mathematical computations.

| # | Program | Algorithm | Description |
|:---|:---|:---|:---|
| 1 | [Factorial_Calculation.asm](Experiment-7/Source%20Code/Factorial_Calculation.asm) | Factorial | Recursive/Iterative factorial |

---

<!-- =========================================================================================
                                     EXPERIMENT 8
     ========================================================================================= -->
## 📦 Experiment 8: Macro Utilization (1 Program)

Using macros for code reusability and modularity.

| # | Program | Algorithm | Description |
|:---|:---|:---|:---|
| 1 | [Macro_Based_Operations.asm](Experiment-8/Source%20Code/Macro_Based_Operations.asm) | Macros | Reusable code blocks |

---

<!-- =========================================================================================
                                     EXPERIMENT 9
     ========================================================================================= -->
## 🔀 Experiment 9: Array Splitter (1 Program)

Dividing arrays based on specific criteria.

| # | Program | Algorithm | Description |
|:---|:---|:---|:---|
| 1 | [Even_Odd_Array_Splitter.asm](Experiment-9/Source%20Code/Even_Odd_Array_Splitter.asm) | Array Split | Separate even/odd elements |

---

<!-- =========================================================================================
                                     EXPERIMENT 10
     ========================================================================================= -->
## ⬅➡ Experiment 10: Logical Shifting (1 Program)

Bit manipulation through logical shift operations.

| # | Program | Algorithm | Description |
|:---|:---|:---|:---|
| 1 | [Logical_Shift_Operations.asm](Experiment-10/Source%20Code/Logical_Shift_Operations.asm) | Bit Shift | Left/Right logical shifts |

---

<!-- =========================================================================================
                                     HOW TO USE
     ========================================================================================= -->
## 🚀 How to Use

### Running Assembly Programs
1. **Assembler**: Use **MASM** (Microsoft Macro Assembler) or **TASM** (Turbo Assembler)
2. **Emulator**: Recommended: **EMU8086** or **DOSBox**
3. **Execution Steps**:
   ```bash
   # For MASM
   masm filename.asm;
   link filename.obj;
   filename.exe
   
   # For TASM
   tasm filename.asm
   tlink filename.obj
   filename.exe
   ```

---

<!-- =========================================================================================
                                     LEARNING PATH
     ========================================================================================= -->
## 📖 Learning Path

**Beginner Level:**
- Start with **Experiment 1** to understand basic arithmetic and register usage
- Practice data movement instructions (MOV, XCHG)

**Intermediate Level:**
- Explore **Experiments 2, 3, 4, 5** for conversions, strings, sorting, and searching
- Master loop constructs and conditional jumps

**Advanced Level:**
- Study **Experiments 6, 7, 8, 9, 10** for BIOS interrupts, macros, and bit manipulation
- Learn stack operations and procedure calls

---

<!-- =========================================================================================
                                     FOOTER SECTION
     ========================================================================================= -->
<div align="center">

  <!-- Footer Navigation -->
  **[⬆ Back to Top](#microprocessor-lab)**

  **[🔢 Experiment 1](#-experiment-1-basic-arithmetic-8-programs)** &nbsp;·&nbsp; **[🔄 Experiment 2](#-experiment-2-code-conversions-1-program)** &nbsp;·&nbsp; **[📝 Experiment 3](#-experiment-3-string-handling-1-program)** &nbsp;·&nbsp; **[📊 Experiment 4](#-experiment-4-sorting-algorithms-2-programs)** &nbsp;·&nbsp; **[🔍 Experiment 5](#-experiment-5-array-search-1-program)** &nbsp;·&nbsp; **[🕐 Experiment 6](#-experiment-6-system-interfacing-1-program)** &nbsp;·&nbsp; **[🧮 Experiment 7](#-experiment-7-mathematical-operations-1-program)** &nbsp;·&nbsp; **[📦 Experiment 8](#-experiment-8-macro-utilization-1-program)** &nbsp;·&nbsp; **[🔀 Experiment 9](#-experiment-9-array-splitter-1-program)** &nbsp;·&nbsp; **[⬅➡ Experiment 10](#-experiment-10-logical-shifting-1-program)**

  <br>

  **[🏠 Back to Main Repository](../)** &nbsp;·&nbsp; **[💾 8086 Assembly Programs](https://github.com/Amey-Thakur/8086-ASSEMBLY-LANGUAGE-PROGRAMS)**

</div>

---

<div align="center">

  ### [Microprocessor Lab](https://github.com/Amey-Thakur/MICROPROCESSOR-AND-MICROPROCESSOR-LAB/tree/main/Microprocessor%20Lab)

  **CSL501 · Semester V · Computer Engineering**

  *University of Mumbai · Curated by [Amey Thakur](https://github.com/Amey-Thakur)*

</div>
