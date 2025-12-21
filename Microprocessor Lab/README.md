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

Menu-driven program for number system conversions.

| # | Program | Description |
|:---|:---|:---|
| 1 | [Hex_to_BCD_and_BCD_to_Hex.asm](Experiment-2/Source%20Code/Hex_to_BCD_and_BCD_to_Hex.asm) | Hexadecimal to BCD and BCD to Hexadecimal conversion |

---

<!-- =========================================================================================
                                     EXPERIMENT 3
     ========================================================================================= -->
## 📝 Experiment 3: String Handling (1 Program)

String manipulation using DOS interrupts.

| # | Program | Description |
|:---|:---|:---|
| 1 | [Length_Of_An_Input_String.asm](Experiment-3/Source%20Code/Length_Of_An_Input_String.asm) | Calculate length of an input string using BIOS/DOS interrupts |

---

<!-- =========================================================================================
                                     EXPERIMENT 4
     ========================================================================================= -->
## 📊 Experiment 4: Sorting Algorithms (2 Programs)

Implementation of Bubble Sort algorithm for array organization.

| # | Program | Algorithm | Description |
|:---|:---|:---|:---|
| 1 | [Ascending_Order_Sorting.asm](Experiment-4/Source%20Code/Ascending_Order_Sorting.asm) | Bubble Sort | Sort array elements in ascending order |
| 2 | [Descending_Order_Sorting.asm](Experiment-4/Source%20Code/Descending_Order_Sorting.asm) | Bubble Sort | Sort array elements in descending order |

---

<!-- =========================================================================================
                                     EXPERIMENT 5
     ========================================================================================= -->
## 🔍 Experiment 5: Array Search (1 Program)

Finding minimum value in an array.

| # | Program | Description |
|:---|:---|:---|
| 1 | [Minimum_Number_In_An_Array.asm](Experiment-5/Source%20Code/Minimum_Number_In_An_Array.asm) | Traverse array and identify the smallest numerical value |

---

<!-- =========================================================================================
                                     EXPERIMENT 6
     ========================================================================================= -->
## 🕐 Experiment 6: System Interfacing (1 Program)

Retrieving system information using BIOS/DOS interrupts.

| # | Program | Description |
|:---|:---|:---|
| 1 | [Display_System_Time.asm](Experiment-6/Source%20Code/Display_System_Time.asm) | Display current system time in HH:MM:SS format |

---

<!-- =========================================================================================
                                     EXPERIMENT 7
     ========================================================================================= -->
## 🧮 Experiment 7: Mathematical Operations (1 Program)

Advanced mathematical computations.

| # | Program | Description |
|:---|:---|:---|
| 1 | [Factorial_Of_A_Number.asm](Experiment-7/Source%20Code/Factorial_Of_A_Number.asm) | Iterative calculation of factorial |

---

<!-- =========================================================================================
                                     EXPERIMENT 8
     ========================================================================================= -->
## 📦 Experiment 8: Macro Utilization (1 Program)

Demonstrating modularity using 8086 Macros.

| # | Program | Description |
|:---|:---|:---|
| 1 | [Display_String_Using_Macro.asm](Experiment-8/Source%20Code/Display_String_Using_Macro.asm) | Display strings using macro definitions for code reuse |

---

<!-- =========================================================================================
                                     EXPERIMENT 9
     ========================================================================================= -->
## 🔀 Experiment 9: Array Splitter (1 Program)

Mixed C and Assembly language programming.

| # | Program | Language | Description |
|:---|:---|:---:|:---|
| 1 | [Separate_Even_And_Odd_Numbers.c](Experiment-9/Source%20Code/Separate_Even_And_Odd_Numbers.c) | C & ASM | Separate even and odd numbers from a dataset |

---

<!-- =========================================================================================
                                     EXPERIMENT 10
     ========================================================================================= -->
## ⬅➡ Experiment 10: Logical Shifting (1 Program)

Bitwise operations using mixed programming.

| # | Program | Language | Description |
|:---|:---|:---:|:---|
| 1 | [Shift_Number_Multiple_Times.c](Experiment-10/Source%20Code/Shift_Number_Multiple_Times.c) | C & ASM | Perform bitwise left and right shifts on numerical values |

---

<!-- =========================================================================================
                                     HOW TO USE
     ========================================================================================= -->
## 🚀 How to Use

### Running Assembly Programs (Experiments 1-8)
Requires TASM/MASM assembler and DOSBox.
```bash
tasm filename.asm
tlink filename.obj
filename.exe
```

### Running Mixed C/ASM Programs (Experiments 9-10)
Requires Turbo C++ with inline assembly support.
```bash
tcc filename.c
filename.exe
```

---

<!-- =========================================================================================
                                     LEARNING PATH
     ========================================================================================= -->
## 📖 Learning Path

**Beginner Level:**
- Start with **Experiment 1** to understand basic 8086 arithmetic instructions.
- Learn register manipulation and memory addressing.

**Intermediate Level:**
- Explore **Experiments 2-5** for data manipulation and control flow.
- Understand loops, comparisons, and DOS interrupts.

**Advanced Level:**
- Study **Experiments 6-8** for system interfacing and macros.
- Master **Experiments 9-10** for mixed C/Assembly programming.

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
