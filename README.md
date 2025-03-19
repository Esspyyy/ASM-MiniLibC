# 🚀 Assembly MinilibC

<div align="center">
  <img src="https://img.shields.io/badge/language-Assembly-red.svg" alt="Language: Assembly">
  <img src="https://img.shields.io/badge/architecture-x86__64-blue.svg" alt="Architecture: x86_64">
</div>

## 📝 Description

A minimalist implementation of the standard C library functions in x86-64 assembly language. This project provides low-level implementations of common string and memory manipulation functions.

## ✨ Implemented Functions

| Category | Functions |
|----------|-----------|
| **String Operations** | `strlen`, `strchr`, `strrchr`, `strcmp`, `strncmp`, `strcasecmp`, `strstr`, `strpbrk`, `strcspn`, `strfry` |
| **Memory Operations** | `memset`, `memcpy`, `memmove`, `memfrob` |
| **Other Utilities** | `ffs` (find first set bit) |

## 🔎 Function Details

- **strlen**: Calculate the length of a string
- **strchr/strrchr**: Locate character in string (first/last occurrence)
- **strcmp/strncmp**: Compare strings (full/n characters)
- **strcasecmp**: Case-insensitive string comparison
- **strstr**: Locate a substring
- **strpbrk**: Search a string for any of a set of characters
- **strcspn**: Get span until character in string
- **strfry**: Randomize a string
- **memset**: Fill memory with a constant byte
- **memcpy**: Copy memory area
- **memmove**: Copy memory area with overlap handling
- **memfrob**: Frobnicate (encrypt) a memory area
- **ffs**: Find first bit set in a word

## 🛠️ Building the Library

```bash
# Build the shared library
make

# Clean object files
make clean

# Full clean (remove objects and binary)
make fclean

# Rebuild from scratch
make re

# Run tests
make test
```

## 📚 Usage

Once compiled, you can use the library by preloading it:

```bash
LD_PRELOAD=./libasm.so your_program
```

Or link it directly during compilation:

```bash
gcc -o your_program your_source.c -L. -lasm
```

## 📋 Requirements

- NASM assembler
- GCC compiler
- Linux environment (x86-64)

## 💡 Implementation Details

All functions are written in x86-64 assembly language following the System V AMD64 ABI calling convention, where:
- First integer/pointer argument: RDI
- Second integer/pointer argument: RSI
- Third integer/pointer argument: RDX
- Return value: RAX

## 📜 License

This project is part of an EPITECH school assignment.
