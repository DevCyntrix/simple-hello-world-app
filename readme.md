# Simple Hello World Application

This repository contains two versions of a hello world application. One is written in c and the other in Intel x86 assembly using the gnu assembler.

## Comparison

|       Type      | Filesize   | Execution time |
|---------------:|------------|----------------|
| static built C  | 880K bytes | 0,001s         |
| dynamic built C | 16K        | 0,001s         |
| Assembly        | 12K        | <0,001s        |

# Build
```sh
make all
```