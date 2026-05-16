>[Inicio](README.md)

# Mnemónicos RISC-V ISA
Listado de mnemónicos RISC-V organizado por base y extensiones. Incluye instrucciones reales del ISA; no pretende enumerar todas las pseudo-instrucciones del ensamblador GNU/LLVM, porque esas no son instrucciones de máquina sino alias del ensamblador.

Fuentes oficiales: [RISC-V Unprivileged ISA Specification y RISC-V Privileged ISA Specification, publicados en la RISC-V Ratified Specifications Library](https://docs.riscv.org/reference/isa/v20240411/unpriv/intro.html).

## Tabla
| Extensión | Mnemónico | Descripción breve | Referencia oficial |
|---|---|---|---|
| `RV32I` | `LUI` | Load Upper Immediate | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `AUIPC` | Add Upper Immediate to PC | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `JAL` | Jump and Link | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `JALR` | Jump and Link Register | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `BEQ` | Branch if Equal | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `BNE` | Branch if Not Equal | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `BLT` | Branch if Less Than, signed | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `BGE` | Branch if Greater/Equal, signed | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `BLTU` | Branch if Less Than, unsigned | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `BGEU` | Branch if Greater/Equal, unsigned | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `LB` | Load Byte | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `LH` | Load Halfword | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `LW` | Load Word | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `LBU` | Load Byte Unsigned | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `LHU` | Load Halfword Unsigned | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `SB` | Store Byte | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `SH` | Store Halfword | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `SW` | Store Word | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `ADDI` | Add Immediate | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `SLTI` | Set Less Than Immediate, signed | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `SLTIU` | Set Less Than Immediate, unsigned | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `XORI` | XOR Immediate | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `ORI` | OR Immediate | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `ANDI` | AND Immediate | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `SLLI` | Shift Left Logical Immediate | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `SRLI` | Shift Right Logical Immediate | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `SRAI` | Shift Right Arithmetic Immediate | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `ADD` | Add | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `SUB` | Subtract | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `SLL` | Shift Left Logical | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `SLT` | Set Less Than, signed | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `SLTU` | Set Less Than, unsigned | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `XOR` | Exclusive OR | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `SRL` | Shift Right Logical | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `SRA` | Shift Right Arithmetic | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `OR` | OR | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `AND` | AND | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `FENCE` | Memory ordering fence | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `ECALL` | Environment call | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `EBREAK` | Breakpoint / debugger trap | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV32I` | `NOP` | Canonical no-operation alias | RISC-V Unprivileged ISA, Vol. I ch. RV32I |
| `RV64I` | `LWU` | Load Word Unsigned | RISC-V Unprivileged ISA, Vol. I ch. RV64I |
| `RV64I` | `LD` | Load Doubleword | RISC-V Unprivileged ISA, Vol. I ch. RV64I |
| `RV64I` | `SD` | Store Doubleword | RISC-V Unprivileged ISA, Vol. I ch. RV64I |
| `RV64I` | `ADDIW` | Add Immediate Word | RISC-V Unprivileged ISA, Vol. I ch. RV64I |
| `RV64I` | `SLLIW` | Shift Left Logical Immediate Word | RISC-V Unprivileged ISA, Vol. I ch. RV64I |
| `RV64I` | `SRLIW` | Shift Right Logical Immediate Word | RISC-V Unprivileged ISA, Vol. I ch. RV64I |
| `RV64I` | `SRAIW` | Shift Right Arithmetic Immediate Word | RISC-V Unprivileged ISA, Vol. I ch. RV64I |
| `RV64I` | `ADDW` | Add Word | RISC-V Unprivileged ISA, Vol. I ch. RV64I |
| `RV64I` | `SUBW` | Subtract Word | RISC-V Unprivileged ISA, Vol. I ch. RV64I |
| `RV64I` | `SLLW` | Shift Left Logical Word | RISC-V Unprivileged ISA, Vol. I ch. RV64I |
| `RV64I` | `SRLW` | Shift Right Logical Word | RISC-V Unprivileged ISA, Vol. I ch. RV64I |
| `RV64I` | `SRAW` | Shift Right Arithmetic Word | RISC-V Unprivileged ISA, Vol. I ch. RV64I |
| `Zifencei` | `FENCE.I` | Instruction-fetch fence | RISC-V Unprivileged ISA, Vol. I ch. Zifencei |
| `Zicsr` | `CSRRW` | Atomic read/write CSR | RISC-V Unprivileged ISA, Vol. I ch. Zicsr |
| `Zicsr` | `CSRRS` | Atomic read and set bits in CSR | RISC-V Unprivileged ISA, Vol. I ch. Zicsr |
| `Zicsr` | `CSRRC` | Atomic read and clear bits in CSR | RISC-V Unprivileged ISA, Vol. I ch. Zicsr |
| `Zicsr` | `CSRRWI` | Immediate read/write CSR | RISC-V Unprivileged ISA, Vol. I ch. Zicsr |
| `Zicsr` | `CSRRSI` | Immediate read and set bits in CSR | RISC-V Unprivileged ISA, Vol. I ch. Zicsr |
| `Zicsr` | `CSRRCI` | Immediate read and clear bits in CSR | RISC-V Unprivileged ISA, Vol. I ch. Zicsr |
| `Zicntr/Zihpm` | `RDCYCLE` | Read cycle counter | RISC-V Unprivileged ISA, Vol. I ch. counters |
| `Zicntr/Zihpm` | `RDTIME` | Read time counter | RISC-V Unprivileged ISA, Vol. I ch. counters |
| `Zicntr/Zihpm` | `RDINSTRET` | Read retired-instruction counter | RISC-V Unprivileged ISA, Vol. I ch. counters |
| `Zicntr/Zihpm` | `RDCYCLEH` | Read high half of cycle counter, RV32 | RISC-V Unprivileged ISA, Vol. I ch. counters |
| `Zicntr/Zihpm` | `RDTIMEH` | Read high half of time counter, RV32 | RISC-V Unprivileged ISA, Vol. I ch. counters |
| `Zicntr/Zihpm` | `RDINSTRETH` | Read high half of instret counter, RV32 | RISC-V Unprivileged ISA, Vol. I ch. counters |
| `Zihintpause/Zihintntl` | `PAUSE` | Pause hint | RISC-V Unprivileged ISA, Vol. I ch. hints |
| `Zihintpause/Zihintntl` | `NTL.P1` | Non-temporal locality hint P1 | RISC-V Unprivileged ISA, Vol. I ch. hints |
| `Zihintpause/Zihintntl` | `NTL.PALL` | Non-temporal locality hint PALL | RISC-V Unprivileged ISA, Vol. I ch. hints |
| `Zihintpause/Zihintntl` | `NTL.S1` | Non-temporal locality hint S1 | RISC-V Unprivileged ISA, Vol. I ch. hints |
| `Zihintpause/Zihintntl` | `NTL.ALL` | Non-temporal locality hint ALL | RISC-V Unprivileged ISA, Vol. I ch. hints |
| `Zimop` | `MOP.R.n` | May-Be-Operation, register form | RISC-V Unprivileged ISA, Vol. I ch. Zimop |
| `Zimop` | `MOP.RR.n` | May-Be-Operation, register-register form | RISC-V Unprivileged ISA, Vol. I ch. Zimop |
| `Zicond` | `CZERO.EQZ` | Conditional zero if equal to zero | RISC-V Unprivileged ISA, Vol. I ch. Zicond |
| `Zicond` | `CZERO.NEZ` | Conditional zero if not equal to zero | RISC-V Unprivileged ISA, Vol. I ch. Zicond |
| `M` | `MUL` | Multiply, low bits | RISC-V Unprivileged ISA, Vol. I ch. M |
| `M` | `MULH` | Multiply high, signed×signed | RISC-V Unprivileged ISA, Vol. I ch. M |
| `M` | `MULHSU` | Multiply high, signed×unsigned | RISC-V Unprivileged ISA, Vol. I ch. M |
| `M` | `MULHU` | Multiply high, unsigned×unsigned | RISC-V Unprivileged ISA, Vol. I ch. M |
| `M` | `DIV` | Divide signed | RISC-V Unprivileged ISA, Vol. I ch. M |
| `M` | `DIVU` | Divide unsigned | RISC-V Unprivileged ISA, Vol. I ch. M |
| `M` | `REM` | Remainder signed | RISC-V Unprivileged ISA, Vol. I ch. M |
| `M` | `REMU` | Remainder unsigned | RISC-V Unprivileged ISA, Vol. I ch. M |
| `M` | `MULW` | Multiply Word, RV64 | RISC-V Unprivileged ISA, Vol. I ch. M |
| `M` | `DIVW` | Divide Word signed, RV64 | RISC-V Unprivileged ISA, Vol. I ch. M |
| `M` | `DIVUW` | Divide Word unsigned, RV64 | RISC-V Unprivileged ISA, Vol. I ch. M |
| `M` | `REMW` | Remainder Word signed, RV64 | RISC-V Unprivileged ISA, Vol. I ch. M |
| `M` | `REMUW` | Remainder Word unsigned, RV64 | RISC-V Unprivileged ISA, Vol. I ch. M |
| `A` | `LR.W / LR.D` | Atomic memory operation, word/doubleword variants | RISC-V Unprivileged ISA, Vol. I ch. A |
| `A` | `SC.W / SC.D` | Atomic memory operation, word/doubleword variants | RISC-V Unprivileged ISA, Vol. I ch. A |
| `A` | `AMOSWAP.W / AMOSWAP.D` | Atomic memory operation, word/doubleword variants | RISC-V Unprivileged ISA, Vol. I ch. A |
| `A` | `AMOADD.W / AMOADD.D` | Atomic memory operation, word/doubleword variants | RISC-V Unprivileged ISA, Vol. I ch. A |
| `A` | `AMOXOR.W / AMOXOR.D` | Atomic memory operation, word/doubleword variants | RISC-V Unprivileged ISA, Vol. I ch. A |
| `A` | `AMOAND.W / AMOAND.D` | Atomic memory operation, word/doubleword variants | RISC-V Unprivileged ISA, Vol. I ch. A |
| `A` | `AMOOR.W / AMOOR.D` | Atomic memory operation, word/doubleword variants | RISC-V Unprivileged ISA, Vol. I ch. A |
| `A` | `AMOMIN.W / AMOMIN.D` | Atomic memory operation, word/doubleword variants | RISC-V Unprivileged ISA, Vol. I ch. A |
| `A` | `AMOMAX.W / AMOMAX.D` | Atomic memory operation, word/doubleword variants | RISC-V Unprivileged ISA, Vol. I ch. A |
| `A` | `AMOMINU.W / AMOMINU.D` | Atomic memory operation, word/doubleword variants | RISC-V Unprivileged ISA, Vol. I ch. A |
| `A` | `AMOMAXU.W / AMOMAXU.D` | Atomic memory operation, word/doubleword variants | RISC-V Unprivileged ISA, Vol. I ch. A |
| `Zawrs` | `WRS.NTO` | Wait-on-reservation-set, no timeout | RISC-V Unprivileged ISA, Vol. I ch. Zawrs |
| `Zawrs` | `WRS.STO` | Wait-on-reservation-set, short timeout | RISC-V Unprivileged ISA, Vol. I ch. Zawrs |
| `Zacas` | `AMOCAS.W` | Atomic compare-and-swap word | RISC-V Unprivileged ISA, Vol. I ch. Zacas |
| `Zacas` | `AMOCAS.D` | Atomic compare-and-swap doubleword | RISC-V Unprivileged ISA, Vol. I ch. Zacas |
| `Zacas` | `AMOCAS.Q` | Atomic compare-and-swap quadword | RISC-V Unprivileged ISA, Vol. I ch. Zacas |
| `CMO/Zicb*` | `PREFETCH.I` | Instruction prefetch hint | RISC-V Unprivileged ISA, Vol. I ch. CMO |
| `CMO/Zicb*` | `PREFETCH.R` | Data-read prefetch hint | RISC-V Unprivileged ISA, Vol. I ch. CMO |
| `CMO/Zicb*` | `PREFETCH.W` | Data-write prefetch hint | RISC-V Unprivileged ISA, Vol. I ch. CMO |
| `CMO/Zicb*` | `CBO.CLEAN` | Cache-block clean | RISC-V Unprivileged ISA, Vol. I ch. CMO |
| `CMO/Zicb*` | `CBO.FLUSH` | Cache-block flush | RISC-V Unprivileged ISA, Vol. I ch. CMO |
| `CMO/Zicb*` | `CBO.INVAL` | Cache-block invalidate | RISC-V Unprivileged ISA, Vol. I ch. CMO |
| `CMO/Zicb*` | `CBO.ZERO` | Cache-block zero | RISC-V Unprivileged ISA, Vol. I ch. CMO |
| `F` | `FL.S` | Load FP single precision | RISC-V Unprivileged ISA, Vol. I ch. F |
| `F` | `FS.S` | Store FP single precision | RISC-V Unprivileged ISA, Vol. I ch. F |
| `F` | `FMADD.S` | Fused multiply-add single precision | RISC-V Unprivileged ISA, Vol. I ch. F |
| `F` | `FMSUB.S` | Fused multiply-subtract single precision | RISC-V Unprivileged ISA, Vol. I ch. F |
| `F` | `FNMSUB.S` | Fused negative multiply-subtract single precision | RISC-V Unprivileged ISA, Vol. I ch. F |
| `F` | `FNMADD.S` | Fused negative multiply-add single precision | RISC-V Unprivileged ISA, Vol. I ch. F |
| `F` | `FADD.S` | Add FP single precision | RISC-V Unprivileged ISA, Vol. I ch. F |
| `F` | `FSUB.S` | Subtract FP single precision | RISC-V Unprivileged ISA, Vol. I ch. F |
| `F` | `FMUL.S` | Multiply FP single precision | RISC-V Unprivileged ISA, Vol. I ch. F |
| `F` | `FDIV.S` | Divide FP single precision | RISC-V Unprivileged ISA, Vol. I ch. F |
| `F` | `FSQRT.S` | Square root FP single precision | RISC-V Unprivileged ISA, Vol. I ch. F |
| `F` | `FSGNJ.S` | Sign inject single precision | RISC-V Unprivileged ISA, Vol. I ch. F |
| `F` | `FSGNJN.S` | Negative sign inject single precision | RISC-V Unprivileged ISA, Vol. I ch. F |
| `F` | `FSGNJX.S` | XOR sign inject single precision | RISC-V Unprivileged ISA, Vol. I ch. F |
| `F` | `FMIN.S` | Minimum FP single precision | RISC-V Unprivileged ISA, Vol. I ch. F |
| `F` | `FMAX.S` | Maximum FP single precision | RISC-V Unprivileged ISA, Vol. I ch. F |
| `F` | `FEQ.S` | Compare equal single precision | RISC-V Unprivileged ISA, Vol. I ch. F |
| `F` | `FLT.S` | Compare less-than single precision | RISC-V Unprivileged ISA, Vol. I ch. F |
| `F` | `FLE.S` | Compare less/equal single precision | RISC-V Unprivileged ISA, Vol. I ch. F |
| `F` | `FCLASS.S` | Classify FP single precision | RISC-V Unprivileged ISA, Vol. I ch. F |
| `F` | `FCVT.W.S` | Convert single FP to signed word | RISC-V Unprivileged ISA, Vol. I ch. F |
| `F` | `FCVT.WU.S` | Convert single FP to unsigned word | RISC-V Unprivileged ISA, Vol. I ch. F |
| `F` | `FCVT.S.W` | Convert signed word to single FP | RISC-V Unprivileged ISA, Vol. I ch. F |
| `F` | `FCVT.S.WU` | Convert unsigned word to single FP | RISC-V Unprivileged ISA, Vol. I ch. F |
| `F` | `FMV.X.W` | Move single FP bits to integer register | RISC-V Unprivileged ISA, Vol. I ch. F |
| `F` | `FMV.W.X` | Move integer bits to single FP register | RISC-V Unprivileged ISA, Vol. I ch. F |
| `D` | `FL.D` | Load FP double precision | RISC-V Unprivileged ISA, Vol. I ch. D |
| `D` | `FS.D` | Store FP double precision | RISC-V Unprivileged ISA, Vol. I ch. D |
| `D` | `FMADD.D` | Fused multiply-add double precision | RISC-V Unprivileged ISA, Vol. I ch. D |
| `D` | `FMSUB.D` | Fused multiply-subtract double precision | RISC-V Unprivileged ISA, Vol. I ch. D |
| `D` | `FNMSUB.D` | Fused negative multiply-subtract double precision | RISC-V Unprivileged ISA, Vol. I ch. D |
| `D` | `FNMADD.D` | Fused negative multiply-add double precision | RISC-V Unprivileged ISA, Vol. I ch. D |
| `D` | `FADD.D` | Add FP double precision | RISC-V Unprivileged ISA, Vol. I ch. D |
| `D` | `FSUB.D` | Subtract FP double precision | RISC-V Unprivileged ISA, Vol. I ch. D |
| `D` | `FMUL.D` | Multiply FP double precision | RISC-V Unprivileged ISA, Vol. I ch. D |
| `D` | `FDIV.D` | Divide FP double precision | RISC-V Unprivileged ISA, Vol. I ch. D |
| `D` | `FSQRT.D` | Square root FP double precision | RISC-V Unprivileged ISA, Vol. I ch. D |
| `D` | `FSGNJ.D` | Sign inject double precision | RISC-V Unprivileged ISA, Vol. I ch. D |
| `D` | `FSGNJN.D` | Negative sign inject double precision | RISC-V Unprivileged ISA, Vol. I ch. D |
| `D` | `FSGNJX.D` | XOR sign inject double precision | RISC-V Unprivileged ISA, Vol. I ch. D |
| `D` | `FMIN.D` | Minimum FP double precision | RISC-V Unprivileged ISA, Vol. I ch. D |
| `D` | `FMAX.D` | Maximum FP double precision | RISC-V Unprivileged ISA, Vol. I ch. D |
| `D` | `FEQ.D` | Compare equal double precision | RISC-V Unprivileged ISA, Vol. I ch. D |
| `D` | `FLT.D` | Compare less-than double precision | RISC-V Unprivileged ISA, Vol. I ch. D |
| `D` | `FLE.D` | Compare less/equal double precision | RISC-V Unprivileged ISA, Vol. I ch. D |
| `D` | `FCLASS.D` | Classify FP double precision | RISC-V Unprivileged ISA, Vol. I ch. D |
| `D` | `FCVT.S.D` | Convert double to single | RISC-V Unprivileged ISA, Vol. I ch. D |
| `D` | `FCVT.D.S` | Convert single to double | RISC-V Unprivileged ISA, Vol. I ch. D |
| `D` | `FCVT.W.D` | Convert double to signed word | RISC-V Unprivileged ISA, Vol. I ch. D |
| `D` | `FCVT.WU.D` | Convert double to unsigned word | RISC-V Unprivileged ISA, Vol. I ch. D |
| `D` | `FCVT.D.W` | Convert signed word to double | RISC-V Unprivileged ISA, Vol. I ch. D |
| `D` | `FCVT.D.WU` | Convert unsigned word to double | RISC-V Unprivileged ISA, Vol. I ch. D |
| `D` | `FCVT.L.D` | Convert double to signed doubleword, RV64 | RISC-V Unprivileged ISA, Vol. I ch. D |
| `D` | `FCVT.LU.D` | Convert double to unsigned doubleword, RV64 | RISC-V Unprivileged ISA, Vol. I ch. D |
| `D` | `FCVT.D.L` | Convert signed doubleword to double, RV64 | RISC-V Unprivileged ISA, Vol. I ch. D |
| `D` | `FCVT.D.LU` | Convert unsigned doubleword to double, RV64 | RISC-V Unprivileged ISA, Vol. I ch. D |
| `D` | `FMV.X.D` | Move double FP bits to integer register, RV64 | RISC-V Unprivileged ISA, Vol. I ch. D |
| `D` | `FMV.D.X` | Move integer bits to double FP register, RV64 | RISC-V Unprivileged ISA, Vol. I ch. D |
| `Q` | `FL.Q` | Load FP quad precision | RISC-V Unprivileged ISA, Vol. I ch. Q |
| `Q` | `FS.Q` | Store FP quad precision | RISC-V Unprivileged ISA, Vol. I ch. Q |
| `Q` | `FMADD.Q` | Fused multiply-add quad precision | RISC-V Unprivileged ISA, Vol. I ch. Q |
| `Q` | `FMSUB.Q` | Fused multiply-subtract quad precision | RISC-V Unprivileged ISA, Vol. I ch. Q |
| `Q` | `FNMSUB.Q` | Fused negative multiply-subtract quad precision | RISC-V Unprivileged ISA, Vol. I ch. Q |
| `Q` | `FNMADD.Q` | Fused negative multiply-add quad precision | RISC-V Unprivileged ISA, Vol. I ch. Q |
| `Q` | `FADD.Q` | Add FP quad precision | RISC-V Unprivileged ISA, Vol. I ch. Q |
| `Q` | `FSUB.Q` | Subtract FP quad precision | RISC-V Unprivileged ISA, Vol. I ch. Q |
| `Q` | `FMUL.Q` | Multiply FP quad precision | RISC-V Unprivileged ISA, Vol. I ch. Q |
| `Q` | `FDIV.Q` | Divide FP quad precision | RISC-V Unprivileged ISA, Vol. I ch. Q |
| `Q` | `FSQRT.Q` | Square root FP quad precision | RISC-V Unprivileged ISA, Vol. I ch. Q |
| `Q` | `FSGNJ.Q` | Sign inject quad precision | RISC-V Unprivileged ISA, Vol. I ch. Q |
| `Q` | `FSGNJN.Q` | Negative sign inject quad precision | RISC-V Unprivileged ISA, Vol. I ch. Q |
| `Q` | `FSGNJX.Q` | XOR sign inject quad precision | RISC-V Unprivileged ISA, Vol. I ch. Q |
| `Q` | `FMIN.Q` | Minimum FP quad precision | RISC-V Unprivileged ISA, Vol. I ch. Q |
| `Q` | `FMAX.Q` | Maximum FP quad precision | RISC-V Unprivileged ISA, Vol. I ch. Q |
| `Q` | `FEQ.Q` | Compare equal quad precision | RISC-V Unprivileged ISA, Vol. I ch. Q |
| `Q` | `FLT.Q` | Compare less-than quad precision | RISC-V Unprivileged ISA, Vol. I ch. Q |
| `Q` | `FLE.Q` | Compare less/equal quad precision | RISC-V Unprivileged ISA, Vol. I ch. Q |
| `Q` | `FCLASS.Q` | Classify FP quad precision | RISC-V Unprivileged ISA, Vol. I ch. Q |
| `C` | `C.ADDI4SPN` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.FLD` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.LQ` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.LW` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.FLW` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.LD` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.FSD` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.SQ` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.SW` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.FSW` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.SD` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.NOP` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.ADDI` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.JAL` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.ADDIW` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.LI` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.ADDI16SP` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.LUI` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.SRLI` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.SRAI` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.ANDI` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.SUB` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.XOR` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.OR` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.AND` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.SUBW` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.ADDW` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.J` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.BEQZ` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.BNEZ` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.SLLI` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.FLDSP` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.LQSP` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.LWSP` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.FLWSP` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.LDSP` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.JR` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.MV` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.EBREAK` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.JALR` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.ADD` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.FSDSP` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.SQSP` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.SWSP` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.FSWSP` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `C` | `C.SDSP` | Compressed 16-bit instruction form | RISC-V Unprivileged ISA, Vol. I ch. C |
| `Zba` | `SH1ADD` | Shift-left-1 and add | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zba` | `SH2ADD` | Shift-left-2 and add | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zba` | `SH3ADD` | Shift-left-3 and add | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zba` | `ADD.UW` | Add unsigned word | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zba` | `SH1ADD.UW` | Shift-left-1 unsigned-word and add | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zba` | `SH2ADD.UW` | Shift-left-2 unsigned-word and add | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zba` | `SH3ADD.UW` | Shift-left-3 unsigned-word and add | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zba` | `SLLI.UW` | Shift-left logical immediate unsigned word | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zbb` | `ANDN` | AND with inverted operand | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zbb` | `ORN` | OR with inverted operand | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zbb` | `XNOR` | Exclusive NOR | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zbb` | `CLZ` | Count leading zeros | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zbb` | `CTZ` | Count trailing zeros | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zbb` | `CPOP` | Population count | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zbb` | `MAX` | Signed maximum | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zbb` | `MAXU` | Unsigned maximum | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zbb` | `MIN` | Signed minimum | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zbb` | `MINU` | Unsigned minimum | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zbb` | `SEXT.B` | Sign-extend byte | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zbb` | `SEXT.H` | Sign-extend halfword | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zbb` | `ZEXT.H` | Zero-extend halfword | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zbb` | `ROL` | Rotate left | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zbb` | `ROR` | Rotate right | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zbb` | `RORI` | Rotate right immediate | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zbb` | `ORC.B` | OR-combine bytes | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zbb` | `REV8` | Byte-reverse | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zbb` | `CLZW` | Count leading zeros word, RV64 | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zbb` | `CTZW` | Count trailing zeros word, RV64 | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zbb` | `CPOPW` | Population count word, RV64 | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zbb` | `ROLW` | Rotate left word, RV64 | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zbb` | `RORW` | Rotate right word, RV64 | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zbb` | `RORIW` | Rotate right immediate word, RV64 | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zbc` | `CLMUL` | Carry-less multiply | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zbc` | `CLMULH` | Carry-less multiply high | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zbc` | `CLMULR` | Carry-less multiply reversed | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zbs` | `BCLR` | Bit clear | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zbs` | `BCLRI` | Bit clear immediate | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zbs` | `BEXT` | Bit extract | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zbs` | `BEXTI` | Bit extract immediate | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zbs` | `BINV` | Bit invert | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zbs` | `BINVI` | Bit invert immediate | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zbs` | `BSET` | Bit set | RISC-V Unprivileged ISA, Vol. I ch. B |
| `Zbs` | `BSETI` | Bit set immediate | RISC-V Unprivileged ISA, Vol. I ch. B |
| `V` | `VSETVLI` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VSETIVLI` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VSETVL` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VLE*` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VSE*` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VLSE*` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VSSE*` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VLUXEI*` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VLOXEI*` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VSUXEI*` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VSOXEI*` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VADD` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VSUB` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VRSUB` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VWADDU` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VWSUBU` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VWADD` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VWSUB` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VADC` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMADC` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VSBC` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMSBC` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VAND` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VOR` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VXOR` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VSLL` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VSRL` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VSRA` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VNSRL` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VNSRA` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMSEQ` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMSNE` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMSLTU` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMSLT` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMSLEU` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMSLE` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMSGTU` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMSGT` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMIN` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMINU` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMAX` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMAXU` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMUL` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMULH` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMULHU` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMULHSU` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VDIV` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VDIVU` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VREM` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VREMU` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMACC` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VNMSAC` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMADD` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VNMSUB` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMERGE` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMV` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VSADDU` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VSADD` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VSSUBU` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VSSUB` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VAADDU` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VAADD` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VASUBU` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VASUB` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VSMUL` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VSSRL` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VSSRA` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VNCLIPU` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VNCLIP` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFADD` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFSUB` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFRSUB` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFWADD` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFWSUB` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFMUL` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFDIV` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFRDIV` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFWMUL` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFMACC` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFNMACC` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFMSAC` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFNMSAC` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFMADD` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFNMADD` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFMSUB` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFNMSUB` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFWMACC` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFWNMACC` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFWMSAC` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFWNMSAC` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFSQRT` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFMIN` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFMAX` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFSGNJ` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFSGNJN` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFSGNJX` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMFEQ` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMFNE` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMFLT` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMFLE` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMFGT` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMFGE` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFCLASS` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFMERGE` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFMV` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFCVT` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFWCVT` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFNCVT` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VREDSUM` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VREDAND` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VREDOR` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VREDXOR` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VREDMINU` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VREDMIN` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VREDMAXU` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VREDMAX` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VWREDSUMU` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VWREDSUM` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFREDOSUM` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFREDUSUM` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFREDMIN` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFREDMAX` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFWREDOSUM` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFWREDUSUM` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMAND` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMNAND` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMANDN` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMXOR` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMOR` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMNOR` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMORN` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMXNOR` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VPOPC` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VFIRST` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMSBF` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMSIF` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VMSOF` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VIOTA` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VID` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VCOMPRESS` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VRGATHER` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VSLIDEUP` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VSLIDEDOWN` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VSLIDE1UP` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `V` | `VSLIDE1DOWN` | Vector instruction mnemonic or mnemonic family/pattern | RISC-V Unprivileged ISA, Vol. I ch. V |
| `Privileged` | `SRET` | Return from supervisor trap | RISC-V Privileged ISA, Vol. II privileged instruction listings |
| `Privileged` | `MRET` | Return from machine trap | RISC-V Privileged ISA, Vol. II privileged instruction listings |
| `Privileged` | `MNRET` | Return from resumable NMI | RISC-V Privileged ISA, Vol. II privileged instruction listings |
| `Privileged` | `WFI` | Wait for interrupt | RISC-V Privileged ISA, Vol. II privileged instruction listings |
| `Privileged` | `SFENCE.VMA` | Supervisor virtual-memory fence | RISC-V Privileged ISA, Vol. II privileged instruction listings |
| `Privileged` | `SINVAL.VMA` | Supervisor fine-grained address-translation invalidation | RISC-V Privileged ISA, Vol. II privileged instruction listings |
| `Privileged` | `SFENCE.W.INVAL` | Order prior stores before invalidations | RISC-V Privileged ISA, Vol. II privileged instruction listings |
| `Privileged` | `SFENCE.INVAL.IR` | Order invalidations before subsequent instruction refetch | RISC-V Privileged ISA, Vol. II privileged instruction listings |
| `Privileged` | `HFENCE.VVMA` | Hypervisor virtual-machine virtual-memory fence | RISC-V Privileged ISA, Vol. II privileged instruction listings |
| `Privileged` | `HFENCE.GVMA` | Hypervisor guest-physical virtual-memory fence | RISC-V Privileged ISA, Vol. II privileged instruction listings |
| `Privileged` | `HLV.B/H/W/BU/HU/WU/D` | Hypervisor load virtual | RISC-V Privileged ISA, Vol. II privileged instruction listings |
| `Privileged` | `HLVX.HU/WU` | Hypervisor load virtual execute | RISC-V Privileged ISA, Vol. II privileged instruction listings |
| `Privileged` | `HSV.B/H/W/D` | Hypervisor store virtual | RISC-V Privileged ISA, Vol. II privileged instruction listings |
