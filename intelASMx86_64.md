>[Inicio](README.md)
# Referencia de instrucciones ASM x86/x86-64 en el Intel SDM
*Fuente: [**Intel® 64 and IA-32 Architectures Software Developer’s Manual, Combined Volumes**, Order Number **325462-091US**, March 2026.](https://www.intel.com/content/www/us/en/developer/articles/technical/intel-sdm.html?utm_source=chatgpt.com)

Este documento recoge las entradas oficiales del índice de la **Instruction Set Reference** del PDF subido. La columna **Página PDF** usa la numeración absoluta del propio archivo PDF. La columna **Página manual** conserva la referencia interna impresa por Intel, por ejemplo `Vol. 2A 3-1`.

> Nota: Intel documenta la ISA con sintaxis y codificaciones oficiales. Un mismo encabezado puede agrupar varios mnemónicos, por ejemplo `FMUL/FMULP/FIMUL`.

Total de entradas extraídas: **788**.

## Índice
- [Vol. 2A-2D: Instruction Set Reference A-Z](#vol-2a-2d-instruction-set-reference-a-z)
- [Vol. 2D: Safer Mode Extensions / GETSEC leaf functions](#vol-2d-safer-mode-extensions--getsec-leaf-functions)
- [Vol. 2D: Intel Xeon Phi unique instructions](#vol-2d-intel-xeon-phi-unique-instructions)

## Vol. 2A-2D: Instruction Set Reference A-Z

| Mnemónico(s) | Título oficial Intel | Página PDF | Página manual |
|---|---|---:|---|
| `AAA` | ASCII Adjust After Addition | 705 | Vol. 2A 3-1 |
| `AAD` | ASCII Adjust AX Before Division | 707 | Vol. 2A 3-3 |
| `AAM` | ASCII Adjust AX After Multiply | 709 | Vol. 2A 3-5 |
| `AAS` | ASCII Adjust AL After Subtraction | 711 | Vol. 2A 3-7 |
| `ADC` | Add With Carry | 713 | Vol. 2A 3-9 |
| `ADCX` | Unsigned Integer Addition of Two Operands With Carry Flag | 716 | Vol. 2A 3-12 |
| `ADD` | Add | 718 | Vol. 2A 3-14 |
| `ADDPD` | Add Packed Double Precision Floating-Point Values | 720 | Vol. 2A 3-16 |
| `ADDPS` | Add Packed Single Precision Floating-Point Values | 723 | Vol. 2A 3-19 |
| `ADDSD` | Add Scalar Double Precision Floating-Point Values | 726 | Vol. 2A 3-22 |
| `ADDSS` | Add Scalar Single Precision Floating-Point Values | 728 | Vol. 2A 3-24 |
| `ADDSUBPD` | Packed Double Precision Floating-Point Add/Subtract | 730 | Vol. 2A 3-26 |
| `ADDSUBPS` | Packed Single Precision Floating-Point Add/Subtract | 732 | Vol. 2A 3-28 |
| `ADOX` | Unsigned Integer Addition of Two Operands With Overflow Flag | 735 | Vol. 2A 3-31 |
| `AESDEC` | Perform One Round of an AES Decryption Flow | 737 | Vol. 2A 3-33 |
| `AESDEC128KL` | Perform Ten Rounds of AES Decryption Flow With Key Locker Using 128-Bit Key | 739 | Vol. 2A 3-35 |
| `AESDEC256KL` | Perform 14 Rounds of AES Decryption Flow With Key Locker Using 256-Bit Key | 741 | Vol. 2A 3-37 |
| `AESDECLAST` | Perform Last Round of an AES Decryption Flow | 743 | Vol. 2A 3-39 |
| `AESDECWIDE128KL` | Perform Ten Rounds of AES Decryption Flow With Key Locker on 8 Blocks Using 128-Bit Key | 745 | Vol. 2A 3-41 |
| `AESDECWIDE256KL` | Perform 14 Rounds of AES Decryption Flow With Key Locker on 8 Blocks Using 256-Bit Key | 747 | Vol. 2A 3-43 |
| `AESENC` | Perform One Round of an AES Encryption Flow | 749 | Vol. 2A 3-45 |
| `AESENC128KL` | Perform Ten Rounds of AES Encryption Flow With Key Locker Using 128-Bit Key | 751 | Vol. 2A 3-47 |
| `AESENC256KL` | Perform 14 Rounds of AES Encryption Flow With Key Locker Using 256-Bit Key | 753 | Vol. 2A 3-49 |
| `AESENCLAST` | Perform Last Round of an AES Encryption Flow | 755 | Vol. 2A 3-51 |
| `AESENCWIDE128KL` | Perform Ten Rounds of AES Encryption Flow With Key Locker on 8 Blocks Using 128-Bit Key | 757 | Vol. 2A 3-53 |
| `AESENCWIDE256KL` | Perform 14 Rounds of AES Encryption Flow With Key Locker on 8 Blocks Using 256-Bit Key | 759 | Vol. 2A 3-55 |
| `AESIMC` | Perform the AES InvMixColumn Transformation | 761 | Vol. 2A 3-57 |
| `AESKEYGENASSIST` | AES Round Key Generation Assist | 762 | Vol. 2A 3-58 |
| `AND` | Logical AND | 764 | Vol. 2A 3-60 |
| `ANDN` | Logical AND NOT | 766 | Vol. 2A 3-62 |
| `ANDNPD` | Bitwise Logical AND NOT of Packed Double Precision Floating-Point Values | 767 | Vol. 2A 3-63 |
| `ANDNPS` | Bitwise Logical AND NOT of Packed Single Precision Floating-Point Values | 770 | Vol. 2A 3-66 |
| `ANDPD` | Bitwise Logical AND of Packed Double Precision Floating-Point Values | 773 | Vol. 2A 3-69 |
| `ANDPS` | Bitwise Logical AND of Packed Single Precision Floating-Point Values | 776 | Vol. 2A 3-72 |
| `ARPL` | Adjust RPL Field of Segment Selector | 779 | Vol. 2A 3-75 |
| `BEXTR` | Bit Field Extract | 781 | Vol. 2A 3-77 |
| `BLENDPD` | Blend Packed Double Precision Floating-Point Values | 782 | Vol. 2A 3-78 |
| `BLENDPS` | Blend Packed Single Precision Floating-Point Values | 784 | Vol. 2A 3-80 |
| `BLENDVPD` | Variable Blend Packed Double Precision Floating-Point Values | 786 | Vol. 2A 3-82 |
| `BLENDVPS` | Variable Blend Packed Single Precision Floating-Point Values | 788 | Vol. 2A 3-84 |
| `BLSI` | Extract Lowest Set Isolated Bit | 791 | Vol. 2A 3-87 |
| `BLSMSK` | Get Mask Up to Lowest Set Bit | 792 | Vol. 2A 3-88 |
| `BLSR` | Reset Lowest Set Bit | 793 | Vol. 2A 3-89 |
| `BNDCL` | Check Lower Bound | 794 | Vol. 2A 3-90 |
| `BNDCU/BNDCN` | Check Upper Bound | 796 | Vol. 2A 3-92 |
| `BNDLDX` | Load Extended Bounds Using Address Translation | 798 | Vol. 2A 3-94 |
| `BNDMK` | Make Bounds | 801 | Vol. 2A 3-97 |
| `BNDMOV` | Move Bounds | 803 | Vol. 2A 3-99 |
| `BNDSTX` | Store Extended Bounds Using Address Translation | 806 | Vol. 2A 3-102 |
| `BOUND` | Check Array Index Against Bounds | 809 | Vol. 2A 3-105 |
| `BSF` | Bit Scan Forward | 811 | Vol. 2A 3-107 |
| `BSR` | Bit Scan Reverse | 813 | Vol. 2A 3-109 |
| `BSWAP` | Byte Swap | 815 | Vol. 2A 3-111 |
| `BT` | Bit Test | 816 | Vol. 2A 3-112 |
| `BTC` | Bit Test and Complement | 818 | Vol. 2A 3-114 |
| `BTR` | Bit Test and Reset | 820 | Vol. 2A 3-116 |
| `BTS` | Bit Test and Set | 822 | Vol. 2A 3-118 |
| `BZHI` | Zero High Bits Starting with Specified Bit Position | 824 | Vol. 2A 3-120 |
| `CALL` | Call Procedure | 825 | Vol. 2A 3-121 |
| `CBW/CWDE/CDQE` | Convert Byte to Word/Convert Word to Doubleword/Convert Doubleword to Quadword | 842 | Vol. 2A 3-138 |
| `CLAC` | Clear AC Flag in EFLAGS Register | 843 | Vol. 2A 3-139 |
| `CLC` | Clear Carry Flag | 844 | Vol. 2A 3-140 |
| `CLD` | Clear Direction Flag | 845 | Vol. 2A 3-141 |
| `CLDEMOTE` | Cache Line Demote | 846 | Vol. 2A 3-142 |
| `CLFLUSH` | Flush Cache Line | 848 | Vol. 2A 3-144 |
| `CLFLUSHOPT` | Flush Cache Line Optimized | 850 | Vol. 2A 3-146 |
| `CLI` | Clear Interrupt Flag | 852 | Vol. 2A 3-148 |
| `CLRSSBSY` | Clear Busy Flag in a Supervisor Shadow Stack Token | 854 | Vol. 2A 3-150 |
| `CLTS` | Clear Task-Switched Flag in CR0 | 856 | Vol. 2A 3-152 |
| `CLUI` | Clear User Interrupt Flag | 857 | Vol. 2A 3-153 |
| `CLWB` | Cache Line Write Back | 858 | Vol. 2A 3-154 |
| `CMC` | Complement Carry Flag | 860 | Vol. 2A 3-156 |
| `CMOVcc` | Conditional Move | 861 | Vol. 2A 3-157 |
| `CMP` | Compare Two Operands | 865 | Vol. 2A 3-161 |
| `CMPccXADD` | Compare and Add if Condition is Met | 867 | Vol. 2A 3-163 |
| `CMPPD` | Compare Packed Double Precision Floating-Point Values | 872 | Vol. 2A 3-168 |
| `CMPPS` | Compare Packed Single Precision Floating-Point Values | 879 | Vol. 2A 3-175 |
| `CMPS/CMPSB/CMPSW/CMPSD/CMPSQ` | Compare String Operands | 885 | Vol. 2A 3-181 |
| `CMPSD` | Compare Scalar Double Precision Floating-Point Value | 889 | Vol. 2A 3-185 |
| `CMPSS` | Compare Scalar Single Precision Floating-Point Value | 893 | Vol. 2A 3-189 |
| `CMPXCHG` | Compare and Exchange | 898 | Vol. 2A 3-194 |
| `CMPXCHG8B/CMPXCHG16B` | Compare and Exchange Bytes | 900 | Vol. 2A 3-196 |
| `COMISD` | Compare Scalar Ordered Double Precision Floating-Point Values and Set EFLAGS | 903 | Vol. 2A 3-199 |
| `COMISS` | Compare Scalar Ordered Single Precision Floating-Point Values and Set EFLAGS | 905 | Vol. 2A 3-201 |
| `CPUID` | CPU Identification | 907 | Vol. 2A 3-203 |
| `CRC32` | Accumulate CRC32 Value | 909 | Vol. 2A 3-205 |
| `CVTDQ2PD` | Convert Packed Doubleword Integers to Packed Double Precision Floating-Point Values | 912 | Vol. 2A 3-208 |
| `CVTDQ2PS` | Convert Packed Doubleword Integers to Packed Single Precision Floating-Point Values | 915 | Vol. 2A 3-211 |
| `CVTPD2DQ` | Convert Packed Double Precision Floating-Point Values to Packed Doubleword Integers | 918 | Vol. 2A 3-214 |
| `CVTPD2PI` | Convert Packed Double Precision Floating-Point Values to Packed Dword Integers | 922 | Vol. 2A 3-218 |
| `CVTPD2PS` | Convert Packed Double Precision Floating-Point Values to Packed Single Precision Floating-Point Values | 923 | Vol. 2A 3-219 |
| `CVTPI2PD` | Convert Packed Dword Integers to Packed Double Precision Floating-Point Values | 927 | Vol. 2A 3-223 |
| `CVTPI2PS` | Convert Packed Dword Integers to Packed Single Precision Floating-Point Values | 928 | Vol. 2A 3-224 |
| `CVTPS2DQ` | Convert Packed Single Precision Floating-Point Values to Packed Signed Doubleword Integer Values | 929 | Vol. 2A 3-225 |
| `CVTPS2PD` | Convert Packed Single Precision Floating-Point Values to Packed Double Precision Floating-Point Values | 932 | Vol. 2A 3-228 |
| `CVTPS2PI` | Convert Packed Single Precision Floating-Point Values to Packed Dword Integers | 935 | Vol. 2A 3-231 |
| `CVTSD2SI` | Convert Scalar Double Precision Floating-Point Value to Signed Integer | 936 | Vol. 2A 3-232 |
| `CVTSD2SS` | Convert Scalar Double Precision Floating-Point Value to Scalar Single Precision Floating-Point Value | 938 | Vol. 2A 3-234 |
| `CVTSI2SD` | Convert Signed Integer to Scalar Double Precision Floating-Point Value | 940 | Vol. 2A 3-236 |
| `CVTSI2SS` | Convert Signed Integer to Scalar Single Precision Floating-Point Value | 942 | Vol. 2A 3-238 |
| `CVTSS2SD` | Convert Scalar Single Precision Floating-Point Value to Scalar Double Precision Floating-Point Value | 944 | Vol. 2A 3-240 |
| `CVTSS2SI` | Convert Scalar Single Precision Floating-Point Value to Signed Integer | 946 | Vol. 2A 3-242 |
| `CVTTPD2DQ` | Convert with Truncation Packed Double Precision Floating-Point Values to Packed Doubleword Integers | 948 | Vol. 2A 3-244 |
| `CVTTPD2PI` | Convert With Truncation Packed Double Precision Floating-Point Values to Packed Dword Integers | 952 | Vol. 2A 3-248 |
| `CVTTPS2DQ` | Convert With Truncation Packed Single Precision Floating-Point Values to Packed Signed Doubleword Integer Values | 953 | Vol. 2A 3-249 |
| `CVTTPS2PI` | Convert With Truncation Packed Single Precision Floating-Point Values to Packed Dword Integers | 956 | Vol. 2A 3-252 |
| `CVTTSD2SI` | Convert With Truncation Scalar Double Precision Floating-Point Value to Signed Integer | 957 | Vol. 2A 3-253 |
| `CVTTSS2SI` | Convert With Truncation Scalar Single Precision Floating-Point Value to Signed Integer | 959 | Vol. 2A 3-255 |
| `CWD/CDQ/CQO` | Convert Word to Doubleword/Convert Doubleword to Quadword | 961 | Vol. 2A 3-257 |
| `DAA` | Decimal Adjust AL After Addition | 962 | Vol. 2A 3-258 |
| `DAS` | Decimal Adjust AL After Subtraction | 964 | Vol. 2A 3-260 |
| `DEC` | Decrement by 1 | 966 | Vol. 2A 3-262 |
| `DIV` | Unsigned Divide | 968 | Vol. 2A 3-264 |
| `DIVPD` | Divide Packed Double Precision Floating-Point Values | 971 | Vol. 2A 3-267 |
| `DIVPS` | Divide Packed Single Precision Floating-Point Values | 974 | Vol. 2A 3-270 |
| `DIVSD` | Divide Scalar Double Precision Floating-Point Value | 977 | Vol. 2A 3-273 |
| `DIVSS` | Divide Scalar Single Precision Floating-Point Values | 979 | Vol. 2A 3-275 |
| `DPPD` | Dot Product of Packed Double Precision Floating-Point Values | 981 | Vol. 2A 3-277 |
| `DPPS` | Dot Product of Packed Single Precision Floating-Point Values | 983 | Vol. 2A 3-279 |
| `EMMS` | Empty MMX Technology State | 986 | Vol. 2A 3-282 |
| `ENCODEKEY128` | Encode 128-Bit Key With Key Locker | 987 | Vol. 2A 3-283 |
| `ENCODEKEY256` | Encode 256-Bit Key With Key Locker | 989 | Vol. 2A 3-285 |
| `ENDBR32` | Terminate an Indirect Branch in 32-bit and Compatibility Mode | 991 | Vol. 2A 3-287 |
| `ENDBR64` | Terminate an Indirect Branch in 64-bit Mode | 992 | Vol. 2A 3-288 |
| `ENQCMD` | Enqueue Command | 993 | Vol. 2A 3-289 |
| `ENQCMDS` | Enqueue Command Supervisor | 996 | Vol. 2A 3-292 |
| `ENTER` | Make Stack Frame for Procedure Parameters | 999 | Vol. 2A 3-295 |
| `ERETS` | Event Return to Supervisor | 1002 | Vol. 2A 3-298 |
| `ERETU` | Event Return to User | 1005 | Vol. 2A 3-301 |
| `EXTRACTPS` | Extract Packed Floating-Point Values | 1009 | Vol. 2A 3-305 |
| `F2XM1` | Compute 2x–1 | 1011 | Vol. 2A 3-307 |
| `FABS` | Absolute Value | 1013 | Vol. 2A 3-309 |
| `FADD/FADDP/FIADD` | Add | 1015 | Vol. 2A 3-311 |
| `FBLD` | Load Binary Coded Decimal | 1018 | Vol. 2A 3-314 |
| `FBSTP` | Store BCD Integer and Pop | 1020 | Vol. 2A 3-316 |
| `FCHS` | Change Sign | 1022 | Vol. 2A 3-318 |
| `FCLEX/FNCLEX` | Clear Exceptions | 1024 | Vol. 2A 3-320 |
| `FCMOVcc` | Floating-Point Conditional Move | 1026 | Vol. 2A 3-322 |
| `FCOM/FCOMP/FCOMPP` | Compare Floating-Point Values | 1028 | Vol. 2A 3-324 |
| `FCOMI/FCOMIP/ FUCOMI/FUCOMIP` | Compare Floating-Point Values and Set EFLAGS | 1031 | Vol. 2A 3-327 |
| `FCOS` | Cosine | 1034 | Vol. 2A 3-330 |
| `FDECSTP` | Decrement Stack-Top Pointer | 1036 | Vol. 2A 3-332 |
| `FDIV/FDIVP/FIDIV` | Divide | 1037 | Vol. 2A 3-333 |
| `FDIVR/FDIVRP/FIDIVR` | Reverse Divide | 1040 | Vol. 2A 3-336 |
| `FFREE` | Free Floating-Point Register | 1043 | Vol. 2A 3-339 |
| `FICOM/FICOMP` | Compare Integer | 1044 | Vol. 2A 3-340 |
| `FILD` | Load Integer | 1046 | Vol. 2A 3-342 |
| `FINCSTP` | Increment Stack-Top Pointer | 1048 | Vol. 2A 3-344 |
| `FINIT/FNINIT` | Initialize Floating-Point Unit | 1049 | Vol. 2A 3-345 |
| `FIST/FISTP` | Store Integer | 1051 | Vol. 2A 3-347 |
| `FISTTP` | Store Integer With Truncation | 1054 | Vol. 2A 3-350 |
| `FLD` | Load Floating-Point Value | 1056 | Vol. 2A 3-352 |
| `FLD1/FLDL2T/FLDL2E/FLDPI/FLDLG2/FLDLN2/FLDZ` | Load Constant | 1058 | Vol. 2A 3-354 |
| `FLDCW` | Load x87 FPU Control Word | 1060 | Vol. 2A 3-356 |
| `FLDENV` | Load x87 FPU Environment | 1062 | Vol. 2A 3-358 |
| `FMUL/FMULP/FIMUL` | Multiply | 1064 | Vol. 2A 3-360 |
| `FNOP` | No Operation | 1067 | Vol. 2A 3-363 |
| `FPATAN` | Partial Arctangent | 1068 | Vol. 2A 3-364 |
| `FPREM` | Partial Remainder | 1070 | Vol. 2A 3-366 |
| `FPREM1` | Partial Remainder | 1072 | Vol. 2A 3-368 |
| `FPTAN` | Partial Tangent | 1074 | Vol. 2A 3-370 |
| `FRNDINT` | Round to Integer | 1076 | Vol. 2A 3-372 |
| `FRSTOR` | Restore x87 FPU State | 1077 | Vol. 2A 3-373 |
| `FSAVE/FNSAVE` | Store x87 FPU State | 1079 | Vol. 2A 3-375 |
| `FSCALE` | Scale | 1082 | Vol. 2A 3-378 |
| `FSIN` | Sine | 1084 | Vol. 2A 3-380 |
| `FSINCOS` | Sine and Cosine | 1086 | Vol. 2A 3-382 |
| `FSQRT` | Square Root | 1088 | Vol. 2A 3-384 |
| `FST/FSTP` | Store Floating-Point Value | 1090 | Vol. 2A 3-386 |
| `FSTCW/FNSTCW` | Store x87 FPU Control Word | 1092 | Vol. 2A 3-388 |
| `FSTENV/FNSTENV` | Store x87 FPU Environment | 1094 | Vol. 2A 3-390 |
| `FSTSW/FNSTSW` | Store x87 FPU Status Word | 1096 | Vol. 2A 3-392 |
| `FSUB/FSUBP/FISUB` | Subtract | 1098 | Vol. 2A 3-394 |
| `FSUBR/FSUBRP/FISUBR` | Reverse Subtract | 1101 | Vol. 2A 3-397 |
| `FTST` | TEST | 1104 | Vol. 2A 3-400 |
| `FUCOM/FUCOMP/FUCOMPP` | Unordered Compare Floating-Point Values | 1106 | Vol. 2A 3-402 |
| `FXAM` | Examine Floating-Point | 1109 | Vol. 2A 3-405 |
| `FXCH` | Exchange Register Contents | 1111 | Vol. 2A 3-407 |
| `FXRSTOR` | Restore x87 FPU, MMX, XMM, and MXCSR State | 1113 | Vol. 2A 3-409 |
| `FXSAVE` | Save x87 FPU, MMX Technology, and SSE State | 1116 | Vol. 2A 3-412 |
| `FXTRACT` | Extract Exponent and Significand | 1124 | Vol. 2A 3-420 |
| `FYL2X` | Compute y * log2x | 1126 | Vol. 2A 3-422 |
| `FYL2XP1` | Compute y * log2(x +1) | 1128 | Vol. 2A 3-424 |
| `GF2P8AFFINEINVQB` | Galois Field Affine Transformation Inverse | 1130 | Vol. 2A 3-426 |
| `GF2P8AFFINEQB` | Galois Field Affine Transformation | 1133 | Vol. 2A 3-429 |
| `GF2P8MULB` | Galois Field Multiply Bytes | 1135 | Vol. 2A 3-431 |
| `HADDPD` | Packed Double Precision Floating-Point Horizontal Add | 1137 | Vol. 2A 3-433 |
| `HADDPS` | Packed Single Precision Floating-Point Horizontal Add | 1140 | Vol. 2A 3-436 |
| `HLT` | Halt | 1143 | Vol. 2A 3-439 |
| `HRESET` | History Reset | 1144 | Vol. 2A 3-440 |
| `HSUBPD` | Packed Double Precision Floating-Point Horizontal Subtract | 1146 | Vol. 2A 3-442 |
| `HSUBPS` | Packed Single Precision Floating-Point Horizontal Subtract | 1149 | Vol. 2A 3-445 |
| `IDIV` | Signed Divide | 1152 | Vol. 2A 3-448 |
| `IMUL` | Signed Multiply | 1155 | Vol. 2A 3-451 |
| `IN` | Input From Port | 1159 | Vol. 2A 3-455 |
| `INC` | Increment by 1 | 1161 | Vol. 2A 3-457 |
| `INCSSPD/INCSSPQ` | Increment Shadow Stack Pointer | 1163 | Vol. 2A 3-459 |
| `INS/INSB/INSW/INSD` | Input from Port to String | 1165 | Vol. 2A 3-464 |
| `INSERTPS` | Insert Scalar Single Precision Floating-Point Value | 1168 | Vol. 2A 3-461 |
| `INT n/INTO/INT3/INT1` | Call to Interrupt Procedure | 1171 | Vol. 2A 3-467 |
| `INVD` | Invalidate Internal Caches | 1187 | Vol. 2A 3-483 |
| `INVLPG` | Invalidate TLB Entries | 1189 | Vol. 2A 3-485 |
| `INVPCID` | Invalidate Process-Context Identifier | 1191 | Vol. 2A 3-487 |
| `IRET/IRETD/IRETQ` | Interrupt Return | 1194 | Vol. 2A 3-490 |
| `Jcc` | Jump if Condition Is Met | 1203 | Vol. 2A 3-499 |
| `JMP` | Jump | 1208 | Vol. 2A 3-504 |
| `KADDW/KADDB/KADDQ/KADDD` | ADD Two Masks | 1217 | Vol. 2A 3-513 |
| `KANDNW/KANDNB/KANDNQ/KANDND` | Bitwise Logical AND NOT Masks | 1219 | Vol. 2A 3-515 |
| `KANDW/KANDB/KANDQ/KANDD` | Bitwise Logical AND Masks | 1220 | Vol. 2A 3-516 |
| `KMOVW/KMOVB/KMOVQ/KMOVD` | Move From and to Mask Registers | 1221 | Vol. 2A 3-517 |
| `KNOTW/KNOTB/KNOTQ/KNOTD` | NOT Mask Register | 1223 | Vol. 2A 3-519 |
| `KORTESTW/KORTESTB/KORTESTQ/KORTESTD` | OR Masks and Set Flags | 1224 | Vol. 2A 3-520 |
| `KORW/KORB/KORQ/KORD` | Bitwise Logical OR Masks | 1226 | Vol. 2A 3-522 |
| `KSHIFTLW/KSHIFTLB/KSHIFTLQ/KSHIFTLD` | Shift Left Mask Registers | 1227 | Vol. 2A 3-523 |
| `KSHIFTRW/KSHIFTRB/KSHIFTRQ/KSHIFTRD` | Shift Right Mask Registers | 1229 | Vol. 2A 3-525 |
| `KTESTW/KTESTB/KTESTQ/KTESTD` | Packed Bit Test Masks and Set Flags | 1231 | Vol. 2A 3-527 |
| `KUNPCKBW/KUNPCKWD/KUNPCKDQ` | Unpack for Mask Registers | 1233 | Vol. 2A 3-529 |
| `KXNORW/KXNORB/KXNORQ/KXNORD` | Bitwise Logical XNOR Masks | 1234 | Vol. 2A 3-530 |
| `KXORW/KXORB/KXORQ/KXORD` | Bitwise Logical XOR Masks | 1235 | Vol. 2A 3-531 |
| `LAHF` | Load Status Flags Into AH Register | 1236 | Vol. 2A 3-532 |
| `LAR` | Load Access Rights | 1237 | Vol. 2A 3-533 |
| `LDDQU` | Load Unaligned Integer 128 Bits | 1241 | Vol. 2A 3-537 |
| `LDMXCSR` | Load MXCSR Register | 1243 | Vol. 2A 3-539 |
| `LDS/LES/LFS/LGS/LSS` | Load Far Pointer | 1244 | Vol. 2A 3-540 |
| `LDTILECFG` | Load Tile Configuration | 1248 | Vol. 2A 3-544 |
| `LEA` | Load Effective Address | 1251 | Vol. 2A 3-547 |
| `LEAVE` | High Level Procedure Exit | 1254 | Vol. 2A 3-550 |
| `LFENCE` | Load Fence | 1256 | Vol. 2A 3-552 |
| `LGDT/LIDT` | Load Global/Interrupt Descriptor Table Register | 1257 | Vol. 2A 3-553 |
| `LKGS` | Load Kernel GS Base | 1260 | Vol. 2A 3-556 |
| `LLDT` | Load Local Descriptor Table Register | 1262 | Vol. 2A 3-558 |
| `LMSW` | Load Machine Status Word | 1264 | Vol. 2A 3-560 |
| `LOADIWKEY` | Load Internal Wrapping Key With Key Locker | 1266 | Vol. 2A 3-562 |
| `LOCK` | Assert LOCK# Signal Prefix | 1269 | Vol. 2A 3-565 |
| `LODS/LODSB/LODSW/LODSD/LODSQ` | Load String | 1271 | Vol. 2A 3-567 |
| `LOOP/LOOPcc` | Loop According to ECX Counter | 1274 | Vol. 2A 3-570 |
| `LSL` | Load Segment Limit | 1277 | Vol. 2A 3-573 |
| `LTR` | Load Task Register | 1280 | Vol. 2A 3-576 |
| `LZCNT` | Count the Number of Leading Zero Bits | 1282 | Vol. 2A 3-578 |
| `MASKMOVDQU` | Store Selected Bytes of Double Quadword | 1290 | Vol. 2B 4-1 |
| `MASKMOVQ` | Store Selected Bytes of Quadword | 1292 | Vol. 2B 4-3 |
| `MAXPD` | Maximum of Packed Double Precision Floating-Point Values | 1294 | Vol. 2B 4-5 |
| `MAXPS` | Maximum of Packed Single Precision Floating-Point Values | 1297 | Vol. 2B 4-8 |
| `MAXSD` | Return Maximum Scalar Double Precision Floating-Point Value | 1300 | Vol. 2B 4-11 |
| `MAXSS` | Return Maximum Scalar Single Precision Floating-Point Value | 1302 | Vol. 2B 4-13 |
| `MFENCE` | Memory Fence | 1304 | Vol. 2B 4-15 |
| `MINPD` | Minimum of Packed Double Precision Floating-Point Values | 1305 | Vol. 2B 4-16 |
| `MINPS` | Minimum of Packed Single Precision Floating-Point Values | 1308 | Vol. 2B 4-19 |
| `MINSD` | Return Minimum Scalar Double Precision Floating-Point Value | 1311 | Vol. 2B 4-22 |
| `MINSS` | Return Minimum Scalar Single Precision Floating-Point Value | 1313 | Vol. 2B 4-24 |
| `MONITOR` | Set Up Monitor Address | 1315 | Vol. 2B 4-26 |
| `MOV` | Move | 1317 | Vol. 2B 4-28 |
| `MOV` | Move to/from Control Registers | 1321 | Vol. 2B 4-32 |
| `MOV` | Move to/from Debug Registers | 1324 | Vol. 2B 4-35 |
| `MOVAPD` | Move Aligned Packed Double Precision Floating-Point Values | 1326 | Vol. 2B 4-37 |
| `MOVAPS` | Move Aligned Packed Single Precision Floating-Point Values | 1330 | Vol. 2B 4-41 |
| `MOVBE` | Move Data After Swapping Bytes | 1334 | Vol. 2B 4-45 |
| `MOVDDUP` | Replicate Double Precision Floating-Point Values | 1337 | Vol. 2B 4-48 |
| `MOVDIR64B` | Move 64 Bytes as Direct Store | 1340 | Vol. 2B 4-51 |
| `MOVDIRI` | Move Doubleword as Direct Store | 1342 | Vol. 2B 4-53 |
| `MOVD/MOVQ` | Move Doubleword/Move Quadword | 1344 | Vol. 2B 4-55 |
| `MOVDQ2Q` | Move Quadword from XMM to MMX Technology Register | 1348 | Vol. 2B 4-59 |
| `MOVDQA,VMOVDQA32/64` | Move Aligned Packed Integer Values | 1349 | Vol. 2B 4-60 |
| `MOVDQU,VMOVDQU8/16/32/64` | Move Unaligned Packed Integer Values | 1354 | Vol. 2B 4-65 |
| `MOVHLPS` | Move Packed Single Precision Floating-Point Values High to Low | 1362 | Vol. 2B 4-73 |
| `MOVHPD` | Move High Packed Double Precision Floating-Point Value | 1364 | Vol. 2B 4-75 |
| `MOVHPS` | Move High Packed Single Precision Floating-Point Values | 1366 | Vol. 2B 4-77 |
| `MOVLHPS` | Move Packed Single Precision Floating-Point Values Low to High | 1368 | Vol. 2B 4-79 |
| `MOVLPD` | Move Low Packed Double Precision Floating-Point Value | 1370 | Vol. 2B 4-81 |
| `MOVLPS` | Move Low Packed Single Precision Floating-Point Values | 1372 | Vol. 2B 4-83 |
| `MOVMSKPD` | Extract Packed Double Precision Floating-Point Sign Mask | 1374 | Vol. 2B 4-85 |
| `MOVMSKPS` | Extract Packed Single Precision Floating-Point Sign Mask | 1376 | Vol. 2B 4-87 |
| `MOVNTDQ` | Store Packed Integers Using Non-Temporal Hint | 1378 | Vol. 2B 4-89 |
| `MOVNTDQA` | Load Double Quadword Non-Temporal Aligned Hint | 1380 | Vol. 2B 4-91 |
| `MOVNTI` | Store Doubleword Using Non-Temporal Hint | 1382 | Vol. 2B 4-93 |
| `MOVNTPD` | Store Packed Double Precision Floating-Point Values Using Non-Temporal Hint | 1384 | Vol. 2B 4-95 |
| `MOVNTPS` | Store Packed Single Precision Floating-Point Values Using Non-Temporal Hint | 1386 | Vol. 2B 4-97 |
| `MOVNTQ` | Store of Quadword Using Non-Temporal Hint | 1388 | Vol. 2B 4-99 |
| `MOVQ` | Move Quadword | 1389 | Vol. 2B 4-100 |
| `MOVQ2DQ` | Move Quadword from MMX Technology to XMM Register | 1392 | Vol. 2B 4-103 |
| `MOVSD` | Move or Merge Scalar Double Precision Floating-Point Value | 1394 | Vol. 2B 4-109 |
| `MOVSHDUP` | Replicate Single Precision Floating-Point Values | 1397 | Vol. 2B 4-112 |
| `MOVSLDUP` | Replicate Single Precision Floating-Point Values | 1400 | Vol. 2B 4-115 |
| `MOVS/MOVSB/MOVSW/MOVSD/MOVSQ` | Move Data From String to String | 1403 | Vol. 2B 4-105 |
| `MOVSS` | Move or Merge Scalar Single Precision Floating-Point Value | 1407 | Vol. 2B 4-118 |
| `MOVSX/MOVSXD` | Move With Sign-Extension | 1410 | Vol. 2B 4-121 |
| `MOVUPD` | Move Unaligned Packed Double Precision Floating-Point Values | 1412 | Vol. 2B 4-123 |
| `MOVUPS` | Move Unaligned Packed Single Precision Floating-Point Values | 1416 | Vol. 2B 4-127 |
| `MOVZX` | Move With Zero-Extend | 1420 | Vol. 2B 4-131 |
| `MPSADBW` | Compute Multiple Packed Sums of Absolute Difference | 1422 | Vol. 2B 4-133 |
| `MUL` | Unsigned Multiply | 1430 | Vol. 2B 4-141 |
| `MULPD` | Multiply Packed Double Precision Floating-Point Values | 1432 | Vol. 2B 4-143 |
| `MULPS` | Multiply Packed Single Precision Floating-Point Values | 1435 | Vol. 2B 4-146 |
| `MULSD` | Multiply Scalar Double Precision Floating-Point Value | 1438 | Vol. 2B 4-149 |
| `MULSS` | Multiply Scalar Single Precision Floating-Point Values | 1440 | Vol. 2B 4-151 |
| `MULX` | Unsigned Multiply Without Affecting Flags | 1442 | Vol. 2B 4-153 |
| `MWAIT` | Monitor Wait | 1444 | Vol. 2B 4-155 |
| `NEG` | Two's Complement Negation | 1447 | Vol. 2B 4-158 |
| `NOP` | No Operation | 1449 | Vol. 2B 4-160 |
| `NOT` | One's Complement Negation | 1450 | Vol. 2B 4-161 |
| `OR` | Logical Inclusive OR | 1452 | Vol. 2B 4-163 |
| `ORPD` | Bitwise Logical OR of Packed Double Precision Floating-Point Values | 1454 | Vol. 2B 4-165 |
| `ORPS` | Bitwise Logical OR of Packed Single Precision Floating-Point Values | 1457 | Vol. 2B 4-168 |
| `OUT` | Output to Port | 1460 | Vol. 2B 4-171 |
| `OUTS/OUTSB/OUTSW/OUTSD` | Output String to Port | 1462 | Vol. 2B 4-173 |
| `PABSB/PABSW/PABSD/PABSQ` | Packed Absolute Value | 1466 | Vol. 2B 4-177 |
| `PACKSSWB/PACKSSDW` | Pack With Signed Saturation | 1472 | Vol. 2B 4-183 |
| `PACKUSDW` | Pack With Unsigned Saturation | 1480 | Vol. 2B 4-191 |
| `PACKUSWB` | Pack With Unsigned Saturation | 1485 | Vol. 2B 4-196 |
| `PADDB/PADDW/PADDD/PADDQ` | Add Packed Integers | 1490 | Vol. 2B 4-201 |
| `PADDSB/PADDSW` | Add Packed Signed Integers with Signed Saturation | 1497 | Vol. 2B 4-208 |
| `PADDUSB/PADDUSW` | Add Packed Unsigned Integers With Unsigned Saturation | 1501 | Vol. 2B 4-212 |
| `PALIGNR` | Packed Align Right | 1505 | Vol. 2B 4-216 |
| `PAND` | Logical AND | 1509 | Vol. 2B 4-220 |
| `PANDN` | Logical AND NOT | 1512 | Vol. 2B 4-223 |
| `PAUSE` | Spin Loop Hint | 1515 | Vol. 2B 4-226 |
| `PAVGB/PAVGW` | Average Packed Integers | 1516 | Vol. 2B 4-227 |
| `PBLENDVB` | Variable Blend Packed Bytes | 1520 | Vol. 2B 4-231 |
| `PBLENDW` | Blend Packed Words | 1524 | Vol. 2B 4-235 |
| `PBNDKB` | Platform Bind Key to Binary Large Object | 1527 | Vol. 2B 4-238 |
| `PCLMULQDQ` | Carry-Less Multiplication Quadword | 1531 | Vol. 2B 4-242 |
| `PCMPEQB/PCMPEQW/PCMPEQD` | Compare Packed Data for Equal | 1534 | Vol. 2B 4-245 |
| `PCMPEQQ` | Compare Packed Qword Data for Equal | 1540 | Vol. 2B 4-251 |
| `PCMPESTRI` | Packed Compare Explicit Length Strings, Return Index | 1543 | Vol. 2B 4-254 |
| `PCMPESTRM` | Packed Compare Explicit Length Strings, Return Mask | 1545 | Vol. 2B 4-256 |
| `PCMPGTB/PCMPGTW/PCMPGTD` | Compare Packed Signed Integers for Greater Than | 1547 | Vol. 2B 4-258 |
| `PCMPGTQ` | Compare Packed Data for Greater Than | 1553 | Vol. 2B 4-264 |
| `PCMPISTRI` | Packed Compare Implicit Length Strings, Return Index | 1556 | Vol. 2B 4-267 |
| `PCMPISTRM` | Packed Compare Implicit Length Strings, Return Mask | 1558 | Vol. 2B 4-269 |
| `PCONFIG` | Platform Configuration | 1560 | Vol. 2B 4-271 |
| `PDEP` | Parallel Bits Deposit | 1571 | Vol. 2B 4-282 |
| `PEXT` | Parallel Bits Extract | 1573 | Vol. 2B 4-284 |
| `PEXTRB/PEXTRD/PEXTRQ` | Extract Byte/Dword/Qword | 1575 | Vol. 2B 4-286 |
| `PEXTRW` | Extract Word | 1578 | Vol. 2B 4-289 |
| `PHADDSW` | Packed Horizontal Add and Saturate | 1581 | Vol. 2B 4-292 |
| `PHADDW/PHADDD` | Packed Horizontal Add | 1583 | Vol. 2B 4-294 |
| `PHMINPOSUW` | Packed Horizontal Word Minimum | 1587 | Vol. 2B 4-298 |
| `PHSUBSW` | Packed Horizontal Subtract and Saturate | 1589 | Vol. 2B 4-300 |
| `PHSUBW/PHSUBD` | Packed Horizontal Subtract | 1591 | Vol. 2B 4-302 |
| `PINSRB/PINSRD/PINSRQ` | Insert Byte/Dword/Qword | 1594 | Vol. 2B 4-305 |
| `PINSRW` | Insert Word | 1597 | Vol. 2B 4-308 |
| `PMADDUBSW` | Multiply and Add Packed Signed and Unsigned Bytes | 1599 | Vol. 2B 4-310 |
| `PMADDWD` | Multiply and Add Packed Integers | 1602 | Vol. 2B 4-313 |
| `PMAXSB/PMAXSW/PMAXSD/PMAXSQ` | Maximum of Packed Signed Integers | 1605 | Vol. 2B 4-316 |
| `PMAXUB/PMAXUW` | Maximum of Packed Unsigned Integers | 1612 | Vol. 2B 4-323 |
| `PMAXUD/PMAXUQ` | Maximum of Packed Unsigned Integers | 1617 | Vol. 2B 4-328 |
| `PMINSB/PMINSW` | Minimum of Packed Signed Integers | 1621 | Vol. 2B 4-332 |
| `PMINSD/PMINSQ` | Minimum of Packed Signed Integers | 1626 | Vol. 2B 4-337 |
| `PMINUB/PMINUW` | Minimum of Packed Unsigned Integers | 1630 | Vol. 2B 4-341 |
| `PMINUD/PMINUQ` | Minimum of Packed Unsigned Integers | 1635 | Vol. 2B 4-346 |
| `PMOVMSKB` | Move Byte Mask | 1639 | Vol. 2B 4-350 |
| `PMOVSX` | Packed Move With Sign Extend | 1641 | Vol. 2B 4-352 |
| `PMOVZX` | Packed Move With Zero Extend | 1651 | Vol. 2B 4-362 |
| `PMULDQ` | Multiply Packed Doubleword Integers | 1661 | Vol. 2B 4-372 |
| `PMULHRSW` | Packed Multiply High With Round and Scale | 1664 | Vol. 2B 4-375 |
| `PMULHUW` | Multiply Packed Unsigned Integers and Store High Result | 1668 | Vol. 2B 4-379 |
| `PMULHW` | Multiply Packed Signed Integers and Store High Result | 1672 | Vol. 2B 4-383 |
| `PMULLD/PMULLQ` | Multiply Packed Integers and Store Low Result | 1676 | Vol. 2B 4-387 |
| `PMULLW` | Multiply Packed Signed Integers and Store Low Result | 1680 | Vol. 2B 4-391 |
| `PMULUDQ` | Multiply Packed Unsigned Doubleword Integers | 1684 | Vol. 2B 4-395 |
| `POP` | Pop a Value From the Stack | 1687 | Vol. 2B 4-398 |
| `POPA/POPAD` | Pop All General-Purpose Registers | 1692 | Vol. 2B 4-403 |
| `POPCNT` | Return the Count of Number of Bits Set to 1 | 1694 | Vol. 2B 4-405 |
| `POPF/POPFD/POPFQ` | Pop Stack Into EFLAGS Register | 1696 | Vol. 2B 4-407 |
| `POR` | Bitwise Logical OR | 1700 | Vol. 2B 4-411 |
| `PREFETCHh` | Prefetch Data Into Caches | 1703 | Vol. 2B 4-414 |
| `PREFETCHW` | Prefetch Data Into Caches in Anticipation of a Write | 1705 | Vol. 2B 4-416 |
| `PSADBW` | Compute Sum of Absolute Differences | 1707 | Vol. 2B 4-418 |
| `PSHUFB` | Packed Shuffle Bytes | 1711 | Vol. 2B 4-422 |
| `PSHUFD` | Shuffle Packed Doublewords | 1715 | Vol. 2B 4-426 |
| `PSHUFHW` | Shuffle Packed High Words | 1719 | Vol. 2B 4-430 |
| `PSHUFLW` | Shuffle Packed Low Words | 1722 | Vol. 2B 4-433 |
| `PSHUFW` | Shuffle Packed Words | 1725 | Vol. 2B 4-436 |
| `PSIGNB/PSIGNW/PSIGND` | Packed SIGN | 1726 | Vol. 2B 4-437 |
| `PSLLDQ` | Shift Double Quadword Left Logical | 1730 | Vol. 2B 4-441 |
| `PSLLW/PSLLD/PSLLQ` | Shift Packed Data Left Logical | 1732 | Vol. 2B 4-443 |
| `PSRAW/PSRAD/PSRAQ` | Shift Packed Data Right Arithmetic | 1744 | Vol. 2B 4-455 |
| `PSRLDQ` | Shift Double Quadword Right Logical | 1754 | Vol. 2B 4-465 |
| `PSRLW/PSRLD/PSRLQ` | Shift Packed Data Right Logical | 1756 | Vol. 2B 4-467 |
| `PSUBB/PSUBW/PSUBD` | Subtract Packed Integers | 1768 | Vol. 2B 4-479 |
| `PSUBQ` | Subtract Packed Quadword Integers | 1776 | Vol. 2B 4-487 |
| `PSUBSB/PSUBSW` | Subtract Packed Signed Integers With Signed Saturation | 1779 | Vol. 2B 4-490 |
| `PSUBUSB/PSUBUSW` | Subtract Packed Unsigned Integers With Unsigned Saturation | 1783 | Vol. 2B 4-494 |
| `PTEST` | Logical Compare | 1787 | Vol. 2B 4-498 |
| `PTWRITE` | Write Data to a Processor Trace Packet | 1789 | Vol. 2B 4-500 |
| `PUNPCKHBW/PUNPCKHWD/PUNPCKHDQ/PUNPCKHQDQ` | Unpack High Data | 1791 | Vol. 2B 4-502 |
| `PUNPCKLBW/PUNPCKLWD/PUNPCKLDQ/PUNPCKLQDQ` | Unpack Low Data | 1801 | Vol. 2B 4-512 |
| `PUSH` | Push Word, Doubleword, or Quadword Onto the Stack | 1811 | Vol. 2B 4-522 |
| `PUSHA/PUSHAD` | Push All General-Purpose Registers | 1815 | Vol. 2B 4-526 |
| `PUSHF/PUSHFD/PUSHFQ` | Push EFLAGS Register Onto the Stack | 1817 | Vol. 2B 4-528 |
| `PXOR` | Logical Exclusive OR | 1819 | Vol. 2B 4-530 |
| `RCL/RCR/ROL/ROR` | Rotate | 1822 | Vol. 2B 4-533 |
| `RCPPS` | Compute Reciprocals of Packed Single Precision Floating-Point Values | 1827 | Vol. 2B 4-538 |
| `RCPSS` | Compute Reciprocal of Scalar Single Precision Floating-Point Values | 1829 | Vol. 2B 4-540 |
| `RDFSBASE/RDGSBASE` | Read FS/GS Segment Base | 1831 | Vol. 2B 4-542 |
| `RDMSR` | Read From Model Specific Register | 1833 | Vol. 2B 4-544 |
| `RDMSRLIST` | Read List of Model Specific Registers | 1835 | Vol. 2A 3-546 |
| `RDPID` | Read Processor ID | 1837 | Vol. 2B 4-548 |
| `RDPKRU` | Read Protection Key Rights for User Pages | 1838 | Vol. 2B 4-549 |
| `RDPMC` | Read Performance-Monitoring Counters | 1840 | Vol. 2B 4-551 |
| `RDRAND` | Read Random Number | 1843 | Vol. 2B 4-554 |
| `RDSEED` | Read Random SEED | 1845 | Vol. 2B 4-556 |
| `RDSSPD/RDSSPQ` | Read Shadow Stack Pointer | 1847 | Vol. 2B 4-558 |
| `RDTSCP` | Read Time-Stamp Counter and Processor ID | 1848 | Vol. 2B 4-561 |
| `RDTSC` | Read Time-Stamp Counter | 1850 | Vol. 2B 4-559 |
| `REP` | Repeat String Operation (Prefix) | 1852 | Vol. 2B 4-563 |
| `REPE/REPZ` | Repeat String Operation While Zero (Prefix) | 1854 | Vol. 2B 4-565 |
| `REPNE/REPNZ` | Repeat String Operation While Not Zero (Prefix) | 1856 | Vol. 2B 4-567 |
| `RET` | Return From Procedure | 1858 | Vol. 2B 4-569 |
| `RORX` | Rotate Right Logical Without Affecting Flags | 1871 | Vol. 2B 4-582 |
| `ROUNDPD` | Round Packed Double Precision Floating-Point Values | 1872 | Vol. 2B 4-583 |
| `ROUNDPS` | Round Packed Single Precision Floating-Point Values | 1875 | Vol. 2B 4-586 |
| `ROUNDSD` | Round Scalar Double Precision Floating-Point Values | 1877 | Vol. 2B 4-588 |
| `ROUNDSS` | Round Scalar Single Precision Floating-Point Values | 1879 | Vol. 2B 4-590 |
| `RSM` | Resume From System Management Mode | 1881 | Vol. 2B 4-592 |
| `RSQRTPS` | Compute Reciprocals of Square Roots of Packed Single Precision Floating-Point Values | 1883 | Vol. 2B 4-594 |
| `RSQRTSS` | Compute Reciprocal of Square Root of Scalar Single Precision Floating-Point Value | 1885 | Vol. 2B 4-596 |
| `RSTORSSP` | Restore Saved Shadow Stack Pointer | 1887 | Vol. 2B 4-598 |
| `SAHF` | Store AH Into Flags | 1890 | Vol. 2B 4-601 |
| `SAL/SAR/SHL/SHR` | Shift | 1892 | Vol. 2B 4-603 |
| `SARX/SHLX/SHRX` | Shift Without Affecting Flags | 1897 | Vol. 2B 4-608 |
| `SAVEPREVSSP` | Save Previous Shadow Stack Pointer | 1899 | Vol. 2B 4-610 |
| `SBB` | Integer Subtraction With Borrow | 1901 | Vol. 2B 4-612 |
| `SCAS/SCASB/SCASW/SCASD` | Scan String | 1904 | Vol. 2B 4-615 |
| `SENDUIPI` | Send User Interprocessor Interrupt | 1908 | Vol. 2B 4-619 |
| `SERIALIZE` | Serialize Instruction Execution | 1910 | Vol. 2B 4-621 |
| `SETcc` | Set Byte on Condition | 1911 | Vol. 2B 4-622 |
| `SETSSBSY` | Mark Shadow Stack Busy | 1914 | Vol. 2B 4-625 |
| `SFENCE` | Store Fence | 1916 | Vol. 2B 4-627 |
| `SGDT` | Store Global Descriptor Table Register | 1917 | Vol. 2B 4-628 |
| `SHA1MSG1` | Perform an Intermediate Calculation for the Next Four SHA1 Message Dwords | 1919 | Vol. 2B 4-630 |
| `SHA1MSG2` | Perform a Final Calculation for the Next Four SHA1 Message Dwords | 1920 | Vol. 2B 4-631 |
| `SHA1NEXTE` | Calculate SHA1 State Variable E After Four Rounds | 1921 | Vol. 2B 4-632 |
| `SHA1RNDS4` | Perform Four Rounds of SHA1 Operation | 1922 | Vol. 2B 4-633 |
| `SHA256MSG1` | Perform an Intermediate Calculation for the Next Four SHA256 Message Dwords | 1924 | Vol. 2B 4-635 |
| `SHA256MSG2` | Perform a Final Calculation for the Next Four SHA256 Message Dwords | 1925 | Vol. 2B 4-636 |
| `SHA256RNDS2` | Perform Two Rounds of SHA256 Operation | 1926 | Vol. 2B 4-637 |
| `SHLD` | Double Precision Shift Left | 1928 | Vol. 2B 4-639 |
| `SHRD` | Double Precision Shift Right | 1931 | Vol. 2B 4-642 |
| `SHUFPD` | Packed Interleave Shuffle of Pairs of Double Precision Floating-Point Values | 1934 | Vol. 2B 4-645 |
| `SHUFPS` | Packed Interleave Shuffle of Quadruplets of Single Precision Floating-Point Values | 1939 | Vol. 2B 4-650 |
| `SIDT` | Store Interrupt Descriptor Table Register | 1943 | Vol. 2B 4-654 |
| `SLDT` | Store Local Descriptor Table Register | 1945 | Vol. 2B 4-656 |
| `SMSW` | Store Machine Status Word | 1947 | Vol. 2B 4-658 |
| `SQRTPD` | Square Root of Double Precision Floating-Point Values | 1949 | Vol. 2B 4-660 |
| `SQRTPS` | Square Root of Single Precision Floating-Point Values | 1952 | Vol. 2B 4-663 |
| `SQRTSD` | Compute Square Root of Scalar Double Precision Floating-Point Value | 1955 | Vol. 2B 4-666 |
| `SQRTSS` | Compute Square Root of Scalar Single Precision Value | 1957 | Vol. 2B 4-668 |
| `STAC` | Set AC Flag in EFLAGS Register | 1959 | Vol. 2B 4-670 |
| `STC` | Set Carry Flag | 1960 | Vol. 2B 4-671 |
| `STD` | Set Direction Flag | 1961 | Vol. 2B 4-672 |
| `STI` | Set Interrupt Flag | 1962 | Vol. 2B 4-673 |
| `STMXCSR` | Store MXCSR Register State | 1964 | Vol. 2B 4-675 |
| `STOS/STOSB/STOSW/STOSD/STOSQ` | Store String | 1965 | Vol. 2B 4-676 |
| `STR` | Store Task Register | 1968 | Vol. 2B 4-679 |
| `STTILECFG` | Store Tile Configuration | 1970 | Vol. 2B 4-681 |
| `STUI` | Set User Interrupt Flag | 1972 | Vol. 2B 4-683 |
| `SUB` | Subtract | 1973 | Vol. 2B 4-684 |
| `SUBPD` | Subtract Packed Double Precision Floating-Point Values | 1975 | Vol. 2B 4-686 |
| `SUBPS` | Subtract Packed Single Precision Floating-Point Values | 1978 | Vol. 2B 4-689 |
| `SUBSD` | Subtract Scalar Double Precision Floating-Point Value | 1981 | Vol. 2B 4-692 |
| `SUBSS` | Subtract Scalar Single Precision Floating-Point Value | 1983 | Vol. 2B 4-694 |
| `SWAPGS` | Swap GS Base Register | 1985 | Vol. 2B 4-696 |
| `SYSCALL` | Fast System Call | 1987 | Vol. 2B 4-698 |
| `SYSENTER` | Fast System Call | 1990 | Vol. 2B 4-701 |
| `SYSEXIT` | Fast Return from Fast System Call | 1994 | Vol. 2B 4-705 |
| `SYSRET` | Return From Fast System Call | 1997 | Vol. 2B 4-708 |
| `TCMMIMFP16PS/TCMMRLFP16PS` | Matrix Multiplication of Complex Tiles Accumulated into Packed Single Precision Tile | 2000 | Vol. 2B 4-711 |
| `TDPBF16PS` | Dot Product of BF16 Tiles Accumulated into Packed Single Precision Tile | 2003 | Vol. 2B 4-714 |
| `TDPBSSD/TDPBSUD/TDPBUSD/TDPBUUD` | Dot Product of Signed/Unsigned Bytes with Dword Accumulation | 2005 | Vol. 2B 4-716 |
| `TDPFP16PS` | Dot Product of FP16 Tiles Accumulated into Packed Single Precision Tile | 2007 | Vol. 2B 4-718 |
| `TEST` | Logical Compare | 2009 | Vol. 2B 4-720 |
| `TESTUI` | Determine User Interrupt Flag | 2011 | Vol. 2B 4-722 |
| `TILELOADD/TILELOADDT1` | Load Tile | 2012 | Vol. 2B 4-723 |
| `TILERELEASE` | Release Tile | 2014 | Vol. 2B 4-725 |
| `TILESTORED` | Store Tile | 2015 | Vol. 2B 4-726 |
| `TILEZERO` | Zero Tile | 2016 | Vol. 2B 4-727 |
| `TPAUSE` | Timed PAUSE | 2017 | Vol. 2B 4-728 |
| `TZCNT` | Count the Number of Trailing Zero Bits | 2019 | Vol. 2B 4-730 |
| `UCOMISD` | Unordered Compare Scalar Double Precision Floating-Point Values and Set EFLAGS | 2021 | Vol. 2B 4-732 |
| `UCOMISS` | Unordered Compare Scalar Single Precision Floating-Point Values and Set EFLAGS | 2023 | Vol. 2B 4-734 |
| `UD` | Undefined Instruction | 2025 | Vol. 2B 4-736 |
| `UIRET` | User-Interrupt Return | 2026 | Vol. 2B 4-737 |
| `UMONITOR` | User Level Set Up Monitor Address | 2028 | Vol. 2B 4-739 |
| `UMWAIT` | User Level Monitor Wait | 2030 | Vol. 2B 4-741 |
| `UNPCKHPD` | Unpack and Interleave High Packed Double Precision Floating-Point Values | 2032 | Vol. 2B 4-743 |
| `UNPCKHPS` | Unpack and Interleave High Packed Single Precision Floating-Point Values | 2036 | Vol. 2B 4-747 |
| `UNPCKLPD` | Unpack and Interleave Low Packed Double Precision Floating-Point Values | 2040 | Vol. 2B 4-751 |
| `UNPCKLPS` | Unpack and Interleave Low Packed Single Precision Floating-Point Values | 2044 | Vol. 2B 4-755 |
| `VADDPH` | Add Packed FP16 Values | 2052 | Vol. 2C 5-1 |
| `VADDSH` | Add Scalar FP16 Values | 2054 | Vol. 2C 5-3 |
| `VALIGND/VALIGNQ` | Align Doubleword/Quadword Vectors | 2055 | Vol. 2C 5-4 |
| `VBCSTNEBF162PS` | Load BF16 Element and Convert to FP32 Element With Broadcast | 2058 | Vol. 2C 5-7 |
| `VBCSTNESH2PS` | Load FP16 Element and Convert to FP32 Element with Broadcast | 2059 | Vol. 2C 5-8 |
| `VBLENDMPD/VBLENDMPS` | Blend Float64/Float32 Vectors Using an OpMask Control | 2060 | Vol. 2C 5-9 |
| `VBROADCAST` | Load with Broadcast Floating-Point Data | 2063 | Vol. 2C 5-12 |
| `VCMPPH` | Compare Packed FP16 Values | 2071 | Vol. 2C 5-20 |
| `VCMPSH` | Compare Scalar FP16 Values | 2073 | Vol. 2C 5-22 |
| `VCOMISH` | Compare Scalar Ordered FP16 Values and Set EFLAGS | 2075 | Vol. 2C 5-24 |
| `VCOMPRESSPD` | Store Sparse Packed Double Precision Floating-Point Values Into Dense Memory | 2077 | Vol. 2C 5-26 |
| `VCOMPRESSPS` | Store Sparse Packed Single Precision Floating-Point Values Into Dense Memory | 2079 | Vol. 2C 5-28 |
| `VCVTDQ2PH` | Convert Packed Signed Doubleword Integers to Packed FP16 Values | 2081 | Vol. 2C 5-30 |
| `VCVTNE2PS2BF16` | Convert Two Packed Single Data to One Packed BF16 Data | 2083 | Vol. 2C 5-32 |
| `VCVTNEEBF162PS` | Convert Even Elements of Packed BF16 Values to FP32 Values | 2085 | Vol. 2C 5-34 |
| `VCVTNEEPH2PS` | Convert Even Elements of Packed FP16 Values to FP32 Values | 2086 | Vol. 2C 5-35 |
| `VCVTNEOBF162PS` | Convert Odd Elements of Packed BF16 Values to FP32 Values | 2087 | Vol. 2C 5-36 |
| `VCVTNEOPH2PS` | Convert Odd Elements of Packed FP16 Values to FP32 Values | 2088 | Vol. 2C 5-37 |
| `VCVTNEPS2BF16` | Convert Packed Single Data to Packed BF16 Data | 2089 | Vol. 2C 5-38 |
| `VCVTPD2PH` | Convert Packed Double Precision FP Values to Packed FP16 Values | 2091 | Vol. 2C 5-40 |
| `VCVTPD2QQ` | Convert Packed Double Precision Floating-Point Values to Packed Quadword Integers | 2093 | Vol. 2C 5-42 |
| `VCVTPD2UDQ` | Convert Packed Double Precision Floating-Point Values to Packed Unsigned Doubleword Integers | 2095 | Vol. 2C 5-44 |
| `VCVTPD2UQQ` | Convert Packed Double Precision Floating-Point Values to Packed Unsigned Quadword Integers | 2098 | Vol. 2C 5-47 |
| `VCVTPH2DQ` | Convert Packed FP16 Values to Signed Doubleword Integers | 2101 | Vol. 2C 5-50 |
| `VCVTPH2PD` | Convert Packed FP16 Values to FP64 Values | 2103 | Vol. 2C 5-52 |
| `VCVTPH2PS/VCVTPH2PSX` | Convert Packed FP16 Values to Single Precision Floating-Point Values | 2105 | Vol. 2C 5-54 |
| `VCVTPH2QQ` | Convert Packed FP16 Values to Signed Quadword Integer Values | 2109 | Vol. 2C 5-58 |
| `VCVTPH2UDQ` | Convert Packed FP16 Values to Unsigned Doubleword Integers | 2111 | Vol. 2C 5-60 |
| `VCVTPH2UQQ` | Convert Packed FP16 Values to Unsigned Quadword Integers | 2113 | Vol. 2C 5-62 |
| `VCVTPH2UW` | Convert Packed FP16 Values to Unsigned Word Integers | 2115 | Vol. 2C 5-64 |
| `VCVTPH2W` | Convert Packed FP16 Values to Signed Word Integers | 2117 | Vol. 2C 5-66 |
| `VCVTPS2PH` | Convert Single Precision FP Value to 16-bit FP Value | 2119 | Vol. 2C 5-68 |
| `VCVTPS2PHX` | Convert Packed Single Precision Floating-Point Values to Packed FP16 Values | 2123 | Vol. 2C 5-72 |
| `VCVTPS2QQ` | Convert Packed Single Precision Floating-Point Values to Packed Signed Quadword Integer Values | 2125 | Vol. 2C 5-74 |
| `VCVTPS2UDQ` | Convert Packed Single Precision Floating-Point Values to Packed Unsigned Doubleword Integer Values | 2127 | Vol. 2C 5-76 |
| `VCVTPS2UQQ` | Convert Packed Single Precision Floating-Point Values to Packed Unsigned Quadword Integer Values | 2130 | Vol. 2C 5-79 |
| `VCVTQQ2PD` | Convert Packed Quadword Integers to Packed Double Precision Floating-Point Values | 2132 | Vol. 2C 5-81 |
| `VCVTQQ2PH` | Convert Packed Signed Quadword Integers to Packed FP16 Values | 2134 | Vol. 2C 5-83 |
| `VCVTQQ2PS` | Convert Packed Quadword Integers to Packed Single Precision Floating-Point Values | 2136 | Vol. 2C 5-85 |
| `VCVTSD2SH` | Convert Low FP64 Value to an FP16 Value | 2138 | Vol. 2C 5-87 |
| `VCVTSD2USI` | Convert Scalar Double Precision Floating-Point Value to Unsigned Integer | 2139 | Vol. 2C 5-88 |
| `VCVTSH2SD` | Convert Low FP16 Value to an FP64 Value | 2141 | Vol. 2C 5-90 |
| `VCVTSH2SI` | Convert Low FP16 Value to Signed Integer | 2142 | Vol. 2C 5-91 |
| `VCVTSH2SS` | Convert Low FP16 Value to FP32 Value | 2144 | Vol. 2C 5-93 |
| `VCVTSH2USI` | Convert Low FP16 Value to Unsigned Integer | 2145 | Vol. 2C 5-94 |
| `VCVTSI2SH` | Convert a Signed Doubleword/Quadword Integer to an FP16 Value | 2147 | Vol. 2C 5-96 |
| `VCVTSS2SH` | Convert Low FP32 Value to an FP16 Value | 2149 | Vol. 2C 5-98 |
| `VCVTSS2USI` | Convert Scalar Single Precision Floating-Point Value to Unsigned Doubleword Integer | 2150 | Vol. 2C 5-99 |
| `VCVTTPD2QQ` | Convert With Truncation Packed Double Precision Floating-Point Values to Packed Quadword Integers | 2152 | Vol. 2C 5-101 |
| `VCVTTPD2UDQ` | Convert With Truncation Packed Double Precision Floating-Point Values to Packed Unsigned Doubleword Integers | 2154 | Vol. 2C 5-103 |
| `VCVTTPD2UQQ` | Convert With Truncation Packed Double Precision Floating-Point Values to Packed Unsigned Quadword Integers | 2156 | Vol. 2C 5-105 |
| `VCVTTPH2DQ` | Convert with Truncation Packed FP16 Values to Signed Doubleword Integers | 2158 | Vol. 2C 5-107 |
| `VCVTTPH2QQ` | Convert with Truncation Packed FP16 Values to Signed Quadword Integers | 2160 | Vol. 2C 5-109 |
| `VCVTTPH2UDQ` | Convert with Truncation Packed FP16 Values to Unsigned Doubleword Integers | 2162 | Vol. 2C 5-111 |
| `VCVTTPH2UQQ` | Convert with Truncation Packed FP16 Values to Unsigned Quadword Integers | 2164 | Vol. 2C 5-113 |
| `VCVTTPH2UW` | Convert Packed FP16 Values to Unsigned Word Integers | 2166 | Vol. 2C 5-115 |
| `VCVTTPH2W` | Convert Packed FP16 Values to Signed Word Integers | 2168 | Vol. 2C 5-117 |
| `VCVTTPS2QQ` | Convert With Truncation Packed Single Precision Floating-Point Values to Packed Signed Quadword Integer Values | 2170 | Vol. 2C 5-119 |
| `VCVTTPS2UDQ` | Convert With Truncation Packed Single Precision Floating-Point Values to Packed Unsigned Doubleword Integer Values | 2172 | Vol. 2C 5-121 |
| `VCVTTPS2UQQ` | Convert With Truncation Packed Single Precision Floating-Point Values to Packed Unsigned Quadword Integer Values | 2174 | Vol. 2C 5-123 |
| `VCVTTSD2USI` | Convert With Truncation Scalar Double Precision Floating-Point Value to Unsigned Integer | 2176 | Vol. 2C 5-125 |
| `VCVTTSH2SI` | Convert with Truncation Low FP16 Value to a Signed Integer | 2178 | Vol. 2C 5-127 |
| `VCVTTSH2USI` | Convert with Truncation Low FP16 Value to an Unsigned Integer | 2179 | Vol. 2C 5-128 |
| `VCVTTSS2USI` | Convert With Truncation Scalar Single Precision Floating-Point Value to Unsigned Integer | 2180 | Vol. 2C 5-129 |
| `VCVTUDQ2PD` | Convert Packed Unsigned Doubleword Integers to Packed Double Precision Floating-Point Values | 2182 | Vol. 2C 5-131 |
| `VCVTUDQ2PH` | Convert Packed Unsigned Doubleword Integers to Packed FP16 Values | 2184 | Vol. 2C 5-133 |
| `VCVTUDQ2PS` | Convert Packed Unsigned Doubleword Integers to Packed Single Precision Floating-Point Values | 2186 | Vol. 2C 5-135 |
| `VCVTUQQ2PD` | Convert Packed Unsigned Quadword Integers to Packed Double Precision Floating-Point Values | 2189 | Vol. 2C 5-138 |
| `VCVTUQQ2PH` | Convert Packed Unsigned Quadword Integers to Packed FP16 Values | 2191 | Vol. 2C 5-140 |
| `VCVTUQQ2PS` | Convert Packed Unsigned Quadword Integers to Packed Single Precision Floating-Point Values | 2193 | Vol. 2C 5-142 |
| `VCVTUSI2SD` | Convert Unsigned Integer to Scalar Double Precision Floating-Point Value | 2195 | Vol. 2C 5-144 |
| `VCVTUSI2SH` | Convert Unsigned Doubleword Integer to an FP16 Value | 2197 | Vol. 2C 5-146 |
| `VCVTUSI2SS` | Convert Unsigned Integer to Scalar Single Precision Floating-Point Value | 2199 | Vol. 2C 5-148 |
| `VCVTUW2PH` | Convert Packed Unsigned Word Integers to FP16 Values | 2201 | Vol. 2C 5-150 |
| `VCVTW2PH` | Convert Packed Signed Word Integers to FP16 Values | 2203 | Vol. 2C 5-152 |
| `VDBPSADBW` | Double Block Packed Sum-Absolute-Differences (SAD) on Unsigned Bytes | 2205 | Vol. 2C 5-154 |
| `VDIVPH` | Divide Packed FP16 Values | 2208 | Vol. 2C 5-157 |
| `VDIVSH` | Divide Scalar FP16 Values | 2210 | Vol. 2C 5-159 |
| `VDPBF16PS` | Dot Product of BF16 Pairs Accumulated Into Packed Single Precision | 2211 | Vol. 2C 5-160 |
| `VERR/VERW` | Verify a Segment for Reading or Writing | 2213 | Vol. 2C 5-162 |
| `VEXPANDPD` | Load Sparse Packed Double Precision Floating-Point Values From Dense Memory | 2215 | Vol. 2C 5-164 |
| `VEXPANDPS` | Load Sparse Packed Single Precision Floating-Point Values From Dense Memory | 2217 | Vol. 2C 5-166 |
| `VEXTRACTF128/VEXTRACTF32x4/VEXTRACTF64x2/VEXTRACTF32x8/VEXTRACTF64x4` | Extract Packed Floating-Point Values | 2219 | Vol. 2C 5-168 |
| `VEXTRACTI128/VEXTRACTI32x4/VEXTRACTI64x2/VEXTRACTI32x8/VEXTRACTI64x4` | Extract Packed Integer Values | 2225 | Vol. 2C 5-174 |
| `VFCMADDCPH/VFMADDCPH` | Complex Multiply and Accumulate FP16 Values | 2231 | Vol. 2C 5-180 |
| `VFCMADDCSH/VFMADDCSH` | Complex Multiply and Accumulate Scalar FP16 Values | 2234 | Vol. 2C 5-183 |
| `VFCMULCPH/VFMULCPH` | Complex Multiply FP16 Values | 2236 | Vol. 2C 5-185 |
| `VFCMULCSH/VFMULCSH` | Complex Multiply Scalar FP16 Values | 2240 | Vol. 2C 5-189 |
| `VFIXUPIMMPD` | Fix Up Special Packed Float64 Values | 2242 | Vol. 2C 5-191 |
| `VFIXUPIMMPS` | Fix Up Special Packed Float32 Values | 2246 | Vol. 2C 5-195 |
| `VFIXUPIMMSD` | Fix Up Special Scalar Float64 Value | 2250 | Vol. 2C 5-199 |
| `VFIXUPIMMSS` | Fix Up Special Scalar Float32 Value | 2254 | Vol. 2C 5-203 |
| `VFMADD132PD/VFMADD213PD/VFMADD231PD` | Fused Multiply-Add of Packed Double Precision Floating-Point Values | 2258 | Vol. 2C 5-207 |
| `VF[,N]MADD[132,213,231]PH` | Fused Multiply-Add of Packed FP16 Values | 2265 | Vol. 2C 5-214 |
| `VFMADD132PS/VFMADD213PS/VFMADD231PS` | Fused Multiply-Add of Packed Single Precision Floating-Point Values | 2271 | Vol. 2C 5-220 |
| `VFMADD132SD/VFMADD213SD/VFMADD231SD` | Fused Multiply-Add of Scalar Double Precision Floating-Point Values | 2277 | Vol. 2C 5-226 |
| `VF[,N]MADD[132,213,231]SH` | Fused Multiply-Add of Scalar FP16 Values | 2280 | Vol. 2C 5-229 |
| `VFMADD132SS/VFMADD213SS/VFMADD231SS` | Fused Multiply-Add of Scalar Single Precision Floating-Point Values | 2283 | Vol. 2C 5-232 |
| `VFMADDSUB132PD/VFMADDSUB213PD/VFMADDSUB231PD` | Fused Multiply-Alternating Add/Subtract of Packed Double Precision Floating-Point Values | 2286 | Vol. 2C 5-235 |
| `VFMADDSUB132PH/VFMADDSUB213PH/VFMADDSUB231PH` | Fused Multiply-Alternating Add/Subtract of Packed FP16 Values | 2294 | Vol. 2C 5-243 |
| `VFMADDSUB132PS/VFMADDSUB213PS/VFMADDSUB231PS` | Fused Multiply-Alternating Add/Subtract of Packed Single Precision Floating-Point Values | 2299 | Vol. 2C 5-248 |
| `VFMSUB132PD/VFMSUB213PD/VFMSUB231PD` | Fused Multiply-Subtract of Packed Double Precision Floating-Point Values | 2307 | Vol. 2C 5-256 |
| `VF[,N]MSUB[132,213,231]PH` | Fused Multiply-Subtract of Packed FP16 Values | 2314 | Vol. 2C 5-263 |
| `VFMSUB132PS/VFMSUB213PS/VFMSUB231PS` | Fused Multiply-Subtract of Packed Single Precision Floating-Point Values | 2320 | Vol. 2C 5-269 |
| `VFMSUB132SD/VFMSUB213SD/VFMSUB231SD` | Fused Multiply-Subtract of Scalar Double Precision Floating-Point Values | 2327 | Vol. 2C 5-276 |
| `VF[,N]MSUB[132,213,231]SH` | Fused Multiply-Subtract of Scalar FP16 Values | 2330 | Vol. 2C 5-279 |
| `VFMSUB132SS/VFMSUB213SS/VFMSUB231SS` | Fused Multiply-Subtract of Scalar Single Precision Floating-Point Values | 2333 | Vol. 2C 5-282 |
| `VFMSUBADD132PD/VFMSUBADD213PD/VFMSUBADD231PD` | Fused Multiply-Alternating Subtract/Add of Packed Double Precision Floating-Point Values | 2336 | Vol. 2C 5-285 |
| `VFMSUBADD132PH/VFMSUBADD213PH/VFMSUBADD231PH` | Fused Multiply-Alternating Subtract/Add of Packed FP16 Values | 2343 | Vol. 2C 5-292 |
| `VFMSUBADD132PS/VFMSUBADD213PS/VFMSUBADD231PS` | Fused Multiply-Alternating Subtract/Add of Packed Single Precision Floating-Point Values | 2348 | Vol. 2C 5-297 |
| `VFNMADD132PD/VFNMADD213PD/VFNMADD231PD` | Fused Negative Multiply-Add of Packed Double Precision Floating-Point Values | 2356 | Vol. 2C 5-305 |
| `VFNMADD132PS/VFNMADD213PS/VFNMADD231PS` | Fused Negative Multiply-Add of Packed Single Precision Floating-Point Values | 2363 | Vol. 2C 5-312 |
| `VFNMADD132SD/VFNMADD213SD/VFNMADD231SD` | Fused Negative Multiply-Add of Scalar Double Precision Floating-Point Values | 2370 | Vol. 2C 5-319 |
| `VFNMADD132SS/VFNMADD213SS/VFNMADD231SS` | Fused Negative Multiply-Add of Scalar Single Precision Floating-Point Values | 2373 | Vol. 2C 5-322 |
| `VFNMSUB132PD/VFNMSUB213PD/VFNMSUB231PD` | Fused Negative Multiply-Subtract of Packed Double Precision Floating-Point Values | 2376 | Vol. 2C 5-325 |
| `VFNMSUB132PS/VFNMSUB213PS/VFNMSUB231PS` | Fused Negative Multiply-Subtract of Packed Single Precision Floating-Point Values | 2383 | Vol. 2C 5-332 |
| `VFNMSUB132SD/VFNMSUB213SD/VFNMSUB231SD` | Fused Negative Multiply-Subtract of Scalar Double Precision Floating-Point Values | 2390 | Vol. 2C 5-339 |
| `VFNMSUB132SS/VFNMSUB213SS/VFNMSUB231SS` | Fused Negative Multiply-Subtract of Scalar Single Precision Floating-Point Values | 2393 | Vol. 2C 5-342 |
| `VFPCLASSPD` | Tests Types of Packed Float64 Values | 2396 | Vol. 2C 5-345 |
| `VFPCLASSPH` | Test Types of Packed FP16 Values | 2399 | Vol. 2C 5-348 |
| `VFPCLASSPS` | Tests Types of Packed Float32 Values | 2402 | Vol. 2C 5-351 |
| `VFPCLASSSD` | Tests Type of a Scalar Float64 Value | 2404 | Vol. 2C 5-353 |
| `VFPCLASSSH` | Test Types of Scalar FP16 Values | 2406 | Vol. 2C 5-355 |
| `VFPCLASSSS` | Tests Type of a Scalar Float32 Value | 2407 | Vol. 2C 5-356 |
| `VGATHERDPD/VGATHERQPD` | Gather Packed Double Precision Floating-Point Values Using Signed Dword/Qword Indices | 2409 | Vol. 2C 5-358 |
| `VGATHERDPS/VGATHERDPD` | Gather Packed Single, Packed Double with Signed Dword Indices | 2413 | Vol. 2C 5-362 |
| `VGATHERDPS/VGATHERQPS` | Gather Packed Single Precision Floating-Point Values Using Signed Dword/Qword Indices | 2416 | Vol. 2C 5-365 |
| `VGATHERQPS/VGATHERQPD` | Gather Packed Single, Packed Double with Signed Qword Indices | 2420 | Vol. 2C 5-369 |
| `VGETEXPPD` | Convert Exponents of Packed Double Precision Floating-Point Values to Double Precision Floating-Point Values | 2423 | Vol. 2C 5-372 |
| `VGETEXPPH` | Convert Exponents of Packed FP16 Values to FP16 Values | 2427 | Vol. 2C 5-376 |
| `VGETEXPPS` | Convert Exponents of Packed Single Precision Floating-Point Values to Single Precision Floating-Point Values | 2430 | Vol. 2C 5-379 |
| `VGETEXPSD` | Convert Exponents of Scalar Double Precision Floating-Point Value to Double Precision Floating-Point Value | 2434 | Vol. 2C 5-383 |
| `VGETEXPSH` | Convert Exponents of Scalar FP16 Values to FP16 Values | 2436 | Vol. 2C 5-385 |
| `VGETEXPSS` | Convert Exponents of Scalar Single Precision Floating-Point Value to Single Precision Floating-Point Value | 2438 | Vol. 2C 5-387 |
| `VGETMANTPD` | Extract Float64 Vector of Normalized Mantissas From Float64 Vector | 2440 | Vol. 2C 5-389 |
| `VGETMANTPH` | Extract FP16 Vector of Normalized Mantissas from FP16 Vector | 2444 | Vol. 2C 5-393 |
| `VGETMANTPS` | Extract Float32 Vector of Normalized Mantissas From Float32 Vector | 2448 | Vol. 2C 5-397 |
| `VGETMANTSD` | Extract Float64 of Normalized Mantissa From Float64 Scalar | 2451 | Vol. 2C 5-400 |
| `VGETMANTSH` | Extract FP16 of Normalized Mantissa from FP16 Scalar | 2453 | Vol. 2C 5-402 |
| `VGETMANTSS` | Extract Float32 Vector of Normalized Mantissa From Float32 Scalar | 2455 | Vol. 2C 5-404 |
| `VINSERTF128/VINSERTF32x4/VINSERTF64x2/VINSERTF32x8/VINSERTF64x4` | Insert Packed Floating-Point Values | 2457 | Vol. 2C 5-406 |
| `VINSERTI128/VINSERTI32x4/VINSERTI64x2/VINSERTI32x8/VINSERTI64x4` | Insert Packed Integer Values | 2462 | Vol. 2C 5-411 |
| `VMASKMOV` | Conditional SIMD Packed Loads and Stores | 2467 | Vol. 2C 5-416 |
| `VMAXPH` | Return Maximum of Packed FP16 Values | 2470 | Vol. 2C 5-419 |
| `VMAXSH` | Return Maximum of Scalar FP16 Values | 2472 | Vol. 2C 5-421 |
| `VMINPH` | Return Minimum of Packed FP16 Values | 2474 | Vol. 2C 5-423 |
| `VMINSH` | Return Minimum Scalar FP16 Value | 2476 | Vol. 2C 5-425 |
| `VMOVSH` | Move Scalar FP16 Value | 2478 | Vol. 2C 5-427 |
| `VMOVW` | Move Word | 2480 | Vol. 2C 5-429 |
| `VMULPH` | Multiply Packed FP16 Values | 2481 | Vol. 2C 5-430 |
| `VMULSH` | Multiply Scalar FP16 Values | 2483 | Vol. 2C 5-432 |
| `VP2INTERSECTD/VP2INTERSECTQ` | Compute Intersection Between DWORDS/QUADWORDS to a Pair of Mask Registers | 2484 | Vol. 2C 5-433 |
| `VPBLENDD` | Blend Packed Dwords | 2486 | Vol. 2C 5-435 |
| `VPBLENDMB/VPBLENDMW` | Blend Byte/Word Vectors Using an Opmask Control | 2488 | Vol. 2C 5-437 |
| `VPBLENDMD/VPBLENDMQ` | Blend Int32/Int64 Vectors Using an OpMask Control | 2490 | Vol. 2C 5-439 |
| `VPBROADCAST` | Load Integer and Broadcast | 2493 | Vol. 2C 5-442 |
| `VPBROADCASTB/W/D/Q` | Load With Broadcast Integer Data From General Purpose Register | 2502 | Vol. 2C 5-451 |
| `VPBROADCASTM` | Broadcast Mask to Vector Register | 2505 | Vol. 2C 5-454 |
| `VPCMPB/VPCMPUB` | Compare Packed Byte Values Into Mask | 2507 | Vol. 2C 5-456 |
| `VPCMPD/VPCMPUD` | Compare Packed Integer Values Into Mask | 2510 | Vol. 2C 5-459 |
| `VPCMPQ/VPCMPUQ` | Compare Packed Integer Values Into Mask | 2513 | Vol. 2C 5-462 |
| `VPCMPW/VPCMPUW` | Compare Packed Word Values Into Mask | 2516 | Vol. 2C 5-465 |
| `VPCOMPRESSB/VCOMPRESSW` | Store Sparse Packed Byte/Word Integer Values Into Dense Memory/Register | 2519 | Vol. 2C 5-468 |
| `VPCOMPRESSD` | Store Sparse Packed Doubleword Integer Values Into Dense Memory/Register | 2522 | Vol. 2C 5-471 |
| `VPCOMPRESSQ` | Store Sparse Packed Quadword Integer Values Into Dense Memory/Register | 2524 | Vol. 2C 5-473 |
| `VPCONFLICTD/Q` | Detect Conflicts Within a Vector of Packed Dword/Qword Values Into Dense Memory/ Register | 2526 | Vol. 2C 5-475 |
| `VPDPB[SU,UU,SS]D[,S]` | Multiply and Add Unsigned and Signed Bytes With and Without Saturation | 2529 | Vol. 2C 5-478 |
| `VPDPBUSD` | Multiply and Add Unsigned and Signed Bytes | 2532 | Vol. 2C 5-481 |
| `VPDPBUSDS` | Multiply and Add Unsigned and Signed Bytes With Saturation | 2535 | Vol. 2C 5-484 |
| `VPDPWSSD` | Multiply and Add Signed Word Integers | 2538 | Vol. 2C 5-487 |
| `VPDPWSSDS` | Multiply and Add Signed Word Integers With Saturation | 2540 | Vol. 2C 5-489 |
| `VPDPW[SU,US,UU]D[,S]` | Multiply and Add Unsigned and Signed Words With and Without Saturation | 2542 | Vol. 2C 5-491 |
| `VPERM2F128` | Permute Floating-Point Values | 2545 | Vol. 2C 5-494 |
| `VPERM2I128` | Permute Integer Values | 2547 | Vol. 2C 5-496 |
| `VPERMB` | Permute Packed Bytes Elements | 2549 | Vol. 2C 5-498 |
| `VPERMD/VPERMW` | Permute Packed Doubleword/Word Elements | 2551 | Vol. 2C 5-500 |
| `VPERMI2B` | Full Permute of Bytes From Two Tables Overwriting the Index | 2554 | Vol. 2C 5-503 |
| `VPERMI2W/D/Q/PS/PD` | Full Permute From Two Tables Overwriting the Index | 2556 | Vol. 2C 5-505 |
| `VPERMILPD` | Permute In-Lane of Pairs of Double Precision Floating-Point Values | 2562 | Vol. 2C 5-511 |
| `VPERMILPS` | Permute In-Lane of Quadruples of Single Precision Floating-Point Values | 2568 | Vol. 2C 5-517 |
| `VPERMPD` | Permute Double Precision Floating-Point Elements | 2573 | Vol. 2C 5-522 |
| `VPERMPS` | Permute Single Precision Floating-Point Elements | 2577 | Vol. 2C 5-526 |
| `VPERMQ` | Qwords Element Permutation | 2580 | Vol. 2C 5-529 |
| `VPERMT2B` | Full Permute of Bytes From Two Tables Overwriting a Table | 2584 | Vol. 2C 5-533 |
| `VPERMT2W/D/Q/PS/PD` | Full Permute From Two Tables Overwriting One Table | 2586 | Vol. 2C 5-535 |
| `VPEXPANDB/VPEXPANDW` | Expand Byte/Word Values | 2592 | Vol. 2C 5-541 |
| `VPEXPANDD` | Load Sparse Packed Doubleword Integer Values From Dense Memory/Register | 2595 | Vol. 2C 5-544 |
| `VPEXPANDQ` | Load Sparse Packed Quadword Integer Values From Dense Memory/Register | 2597 | Vol. 2C 5-546 |
| `VPGATHERDD/VPGATHERDQ` | Gather Packed Dword, Packed Qword With Signed Dword Indices | 2599 | Vol. 2C 5-548 |
| `VPGATHERDD/VPGATHERQD` | Gather Packed Dword Values Using Signed Dword/Qword Indices | 2602 | Vol. 2C 5-551 |
| `VPGATHERDQ/VPGATHERQQ` | Gather Packed Qword Values Using Signed Dword/Qword Indices | 2606 | Vol. 2C 5-555 |
| `VPGATHERQD/VPGATHERQQ` | Gather Packed Dword, Packed Qword with Signed Qword Indices | 2610 | Vol. 2C 5-559 |
| `VPLZCNTD/Q` | Count the Number of Leading Zero Bits for Packed Dword, Packed Qword Values | 2613 | Vol. 2C 5-562 |
| `VPMADD52HUQ` | Packed Multiply of Unsigned 52-Bit Unsigned Integers and Add High 52-Bit Products to 64-Bit Accumulators | 2616 | Vol. 2C 5-565 |
| `VPMADD52LUQ` | Packed Multiply of Unsigned 52-Bit Integers and Add the Low 52-Bit Products to Qword Accumulators | 2619 | Vol. 2C 5-568 |
| `VPMASKMOV` | Conditional SIMD Integer Packed Loads and Stores | 2622 | Vol. 2C 5-571 |
| `VPMOVB2M/VPMOVW2M/VPMOVD2M/VPMOVQ2M` | Convert a Vector Register to a Mask | 2625 | Vol. 2C 5-574 |
| `VPMOVDB/VPMOVSDB/VPMOVUSDB` | Down Convert DWord to Byte | 2628 | Vol. 2C 5-577 |
| `VPMOVDW/VPMOVSDW/VPMOVUSDW` | Down Convert DWord to Word | 2632 | Vol. 2C 5-581 |
| `VPMOVM2B/VPMOVM2W/VPMOVM2D/VPMOVM2Q` | Convert a Mask Register to a Vector Register | 2636 | Vol. 2C 5-585 |
| `VPMOVQB/VPMOVSQB/VPMOVUSQB` | Down Convert QWord to Byte | 2639 | Vol. 2C 5-588 |
| `VPMOVQD/VPMOVSQD/VPMOVUSQD` | Down Convert QWord to DWord | 2643 | Vol. 2C 5-592 |
| `VPMOVQW/VPMOVSQW/VPMOVUSQW` | Down Convert QWord to Word | 2647 | Vol. 2C 5-596 |
| `VPMOVWB/VPMOVSWB/VPMOVUSWB` | Down Convert Word to Byte | 2651 | Vol. 2C 5-600 |
| `VPMULTISHIFTQB` | Select Packed Unaligned Bytes From Quadword Sources | 2655 | Vol. 2C 5-604 |
| `VPOPCNT` | Return the Count of Number of Bits Set to 1 in BYTE/WORD/DWORD/QWORD | 2657 | Vol. 2C 5-606 |
| `VPROLD/VPROLVD/VPROLQ/VPROLVQ` | Bit Rotate Left | 2661 | Vol. 2C 5-610 |
| `VPRORD/VPRORVD/VPRORQ/VPRORVQ` | Bit Rotate Right | 2665 | Vol. 2C 5-614 |
| `VPSCATTERDD/VPSCATTERDQ/VPSCATTERQD/VPSCATTERQQ` | Scatter Packed Dword, Packed Qword with Signed Dword, Signed Qword Indices | 2669 | Vol. 2C 5-618 |
| `VPSHLD` | Concatenate and Shift Packed Data Left Logical | 2673 | Vol. 2C 5-622 |
| `VPSHLDV` | Concatenate and Variable Shift Packed Data Left Logical | 2676 | Vol. 2C 5-625 |
| `VPSHRD` | Concatenate and Shift Packed Data Right Logical | 2679 | Vol. 2C 5-628 |
| `VPSHRDV` | Concatenate and Variable Shift Packed Data Right Logical | 2682 | Vol. 2C 5-631 |
| `VPSHUFBITQMB` | Shuffle Bits From Quadword Elements Using Byte Indexes Into Mask | 2685 | Vol. 2C 5-634 |
| `VPSLLVW/VPSLLVD/VPSLLVQ` | Variable Bit Shift Left Logical | 2687 | Vol. 2C 5-636 |
| `VPSRAVW/VPSRAVD/VPSRAVQ` | Variable Bit Shift Right Arithmetic | 2692 | Vol. 2C 5-641 |
| `VPSRLVW/VPSRLVD/VPSRLVQ` | Variable Bit Shift Right Logical | 2697 | Vol. 2C 5-646 |
| `VPTERNLOGD/VPTERNLOGQ` | Bitwise Ternary Logic | 2702 | Vol. 2C 5-651 |
| `VPTESTMB/VPTESTMW/VPTESTMD/VPTESTMQ` | Logical AND and Set Mask | 2705 | Vol. 2C 5-654 |
| `VPTESTNMB/W/D/Q` | Logical NAND and Set | 2708 | Vol. 2C 5-657 |
| `VRANGEPD` | Range Restriction Calculation for Packed Pairs of Float64 Values | 2712 | Vol. 2C 5-661 |
| `VRANGEPS` | Range Restriction Calculation for Packed Pairs of Float32 Values | 2716 | Vol. 2C 5-665 |
| `VRANGESD` | Range Restriction Calculation From a Pair of Scalar Float64 Values | 2719 | Vol. 2C 5-668 |
| `VRANGESS` | Range Restriction Calculation From a Pair of Scalar Float32 Values | 2722 | Vol. 2C 5-671 |
| `VRCP14PD` | Compute Approximate Reciprocals of Packed Float64 Values | 2725 | Vol. 2C 5-674 |
| `VRCP14PS` | Compute Approximate Reciprocals of Packed Float32 Values | 2727 | Vol. 2C 5-676 |
| `VRCP14SD` | Compute Approximate Reciprocal of Scalar Float64 Value | 2729 | Vol. 2C 5-678 |
| `VRCP14SS` | Compute Approximate Reciprocal of Scalar Float32 Value | 2731 | Vol. 2C 5-680 |
| `VRCPPH` | Compute Reciprocals of Packed FP16 Values | 2733 | Vol. 2C 5-682 |
| `VRCPSH` | Compute Reciprocal of Scalar FP16 Value | 2735 | Vol. 2C 5-684 |
| `VREDUCEPD` | Perform Reduction Transformation on Packed Float64 Values | 2736 | Vol. 2C 5-685 |
| `VREDUCEPH` | Perform Reduction Transformation on Packed FP16 Values | 2739 | Vol. 2C 5-688 |
| `VREDUCEPS` | Perform Reduction Transformation on Packed Float32 Values | 2742 | Vol. 2C 5-691 |
| `VREDUCESD` | Perform a Reduction Transformation on a Scalar Float64 Value | 2744 | Vol. 2C 5-693 |
| `VREDUCESH` | Perform Reduction Transformation on Scalar FP16 Value | 2746 | Vol. 2C 5-695 |
| `VREDUCESS` | Perform a Reduction Transformation on a Scalar Float32 Value | 2748 | Vol. 2C 5-697 |
| `VRNDSCALEPD` | Round Packed Float64 Values to Include a Given Number of Fraction Bits | 2750 | Vol. 2C 5-699 |
| `VRNDSCALEPH` | Round Packed FP16 Values to Include a Given Number of Fraction Bits | 2753 | Vol. 2C 5-702 |
| `VRNDSCALEPS` | Round Packed Float32 Values to Include a Given Number of Fraction Bits | 2756 | Vol. 2C 5-705 |
| `VRNDSCALESD` | Round Scalar Float64 Value to Include a Given Number of Fraction Bits | 2759 | Vol. 2C 5-708 |
| `VRNDSCALESH` | Round Scalar FP16 Value to Include a Given Number of Fraction Bits | 2761 | Vol. 2C 5-710 |
| `VRNDSCALESS` | Round Scalar Float32 Value to Include a Given Number of Fraction Bits | 2763 | Vol. 2C 5-712 |
| `VRSQRT14PD` | Compute Approximate Reciprocals of Square Roots of Packed Float64 Values | 2765 | Vol. 2C 5-714 |
| `VRSQRT14PS` | Compute Approximate Reciprocals of Square Roots of Packed Float32 Values | 2767 | Vol. 2C 5-716 |
| `VRSQRT14SD` | Compute Approximate Reciprocal of Square Root of Scalar Float64 Value | 2769 | Vol. 2C 5-718 |
| `VRSQRT14SS` | Compute Approximate Reciprocal of Square Root of Scalar Float32 Value | 2771 | Vol. 2C 5-720 |
| `VRSQRTPH` | Compute Reciprocals of Square Roots of Packed FP16 Values | 2773 | Vol. 2C 5-722 |
| `VRSQRTSH` | Compute Approximate Reciprocal of Square Root of Scalar FP16 Value | 2775 | Vol. 2C 5-724 |
| `VSCALEFPD` | Scale Packed Float64 Values With Float64 Values | 2776 | Vol. 2C 5-725 |
| `VSCALEFPH` | Scale Packed FP16 Values with FP16 Values | 2779 | Vol. 2C 5-728 |
| `VSCALEFPS` | Scale Packed Float32 Values With Float32 Values | 2782 | Vol. 2C 5-731 |
| `VSCALEFSD` | Scale Scalar Float64 Values With Float64 Values | 2785 | Vol. 2C 5-734 |
| `VSCALEFSH` | Scale Scalar FP16 Values with FP16 Values | 2787 | Vol. 2C 5-736 |
| `VSCALEFSS` | Scale Scalar Float32 Value With Float32 Value | 2789 | Vol. 2C 5-738 |
| `VSCATTERDPS/VSCATTERDPD/VSCATTERQPS/VSCATTERQPD` | Scatter Packed Single Precision, Packed Double Precision Floating-Point Values with Signed Dword and Qword Indices | 2791 | Vol. 2C 5-740 |
| `VSHA512MSG1` | Perform an Intermediate Calculation for the Next Four SHA512 Message Qwords | 2795 | Vol. 2C 5-744 |
| `VSHA512MSG2` | Perform a Final Calculation for the Next Four SHA512 Message Qwords | 2797 | Vol. 2C 5-746 |
| `VSHA512RNDS2` | Perform Two Rounds of SHA512 Operation | 2799 | Vol. 2C 5-748 |
| `VSHUFF32x4/VSHUFF64x2/VSHUFI32x4/VSHUFI64x2` | Shuffle Packed Values at 128-Bit Granularity | 2801 | Vol. 2C 5-750 |
| `VSM3MSG1` | Perform Initial Calculation for the Next Four SM3 Message Words | 2806 | Vol. 2C 5-755 |
| `VSM3MSG2` | Perform Final Calculation for the Next Four SM3 Message Words | 2808 | Vol. 2C 5-757 |
| `VSM3RNDS2` | Perform Two Rounds of SM3 Operation | 2810 | Vol. 2C 5-759 |
| `VSM4KEY4` | Perform Four Rounds of SM4 Key Expansion | 2812 | Vol. 2C 5-761 |
| `VSM4RNDS4` | Performs Four Rounds of SM4 Encryption | 2814 | Vol. 2C 5-763 |
| `VSQRTPH` | Compute Square Root of Packed FP16 Values | 2816 | Vol. 2C 5-765 |
| `VSQRTSH` | Compute Square Root of Scalar FP16 Value | 2818 | Vol. 2C 5-767 |
| `VSUBPH` | Subtract Packed FP16 Values | 2819 | Vol. 2C 5-768 |
| `VSUBSH` | Subtract Scalar FP16 Value | 2821 | Vol. 2C 5-770 |
| `VTESTPD/VTESTPS` | Packed Bit Test | 2822 | Vol. 2C 5-771 |
| `VUCOMISH` | Unordered Compare Scalar FP16 Values and Set EFLAGS | 2825 | Vol. 2C 5-774 |
| `VZEROALL` | Zero XMM, YMM, and ZMM Registers | 2826 | Vol. 2C 5-775 |
| `VZEROUPPER` | Zero Upper Bits of YMM and ZMM Registers | 2827 | Vol. 2C 5-776 |

## Vol. 2D: Safer Mode Extensions / GETSEC leaf functions

| Mnemónico(s) | Título oficial Intel | Página PDF | Página manual |
|---|---|---:|---|
| `GETSEC[CAPABILITIES]` | Report the SMX Capabilities | 2907 | Vol. 2D 7-7 |
| `GETSEC[ENTERACCS]` | Execute Authenticated Chipset Code | 2910 | Vol. 2D 7-10 |
| `GETSEC[EXITAC]` | Exit Authenticated Code Execution Mode | 2918 | Vol. 2D 7-18 |
| `GETSEC[SENTER]` | Enter a Measured Environment | 2922 | Vol. 2D 7-22 |
| `GETSEC[SEXIT]` | Exit Measured Environment | 2931 | Vol. 2D 7-31 |
| `GETSEC[PARAMETERS]` | Report the SMX Parameters | 2934 | Vol. 2D 7-34 |
| `GETSEC[SMCTRL]` | SMX Mode Control | 2938 | Vol. 2D 7-38 |
| `GETSEC[WAKEUP]` | Wake Up Sleeping Processors in Measured Environment | 2941 | Vol. 2D 7-41 |

## Vol. 2D: Intel Xeon Phi unique instructions

| Mnemónico(s) | Título oficial Intel | Página PDF | Página manual |
|---|---|---:|---|
| `PREFETCHWT1` | Prefetch Vector Data Into Caches With Intent to Write and T1 Hint | 2945 | Vol. 2D 8-2 |
| `V4FMADDPS/V4FNMADDPS` | Packed Single Precision Floating-Point Fused Multiply-Add (4-Iterations) | 2947 | Vol. 2D 8-4 |
| `V4FMADDSS/V4FNMADDSS` | Scalar Single Precision Floating-Point Fused Multiply-Add (4-Iterations) | 2949 | Vol. 2D 8-6 |
| `VEXP2PD` | Approximation to the Exponential 2^x of Packed Double Precision Floating-Point Values With Less Than 2^-23 Relative Error | 2951 | Vol. 2D 8-8 |
| `VEXP2PS` | Approximation to the Exponential 2^x of Packed Single Precision Floating-Point Values With Less Than 2^-23 Relative Error | 2953 | Vol. 2D 8-10 |
| `VGATHERPF0DPS/VGATHERPF0QPS/VGATHERPF0DPD/VGATHERPF0QPD` | Sparse Prefetch Packed SP/DP Data Values With Signed Dword, Signed Qword Indices Using T0 Hint | 2955 | Vol. 2D 8-12 |
| `VGATHERPF1DPS/VGATHERPF1QPS/VGATHERPF1DPD/VGATHERPF1QPD` | Sparse Prefetch Packed SP/DP Data Values With Signed Dword, Signed Qword Indices Using T1 Hint | 2957 | Vol. 2D 8-14 |
| `VP4DPWSSDS` | Dot Product of Signed Words With Dword Accumulation and Saturation (4-Iterations) | 2959 | Vol. 2D 8-16 |
| `VP4DPWSSD` | Dot Product of Signed Words With Dword Accumulation (4-Iterations) | 2961 | Vol. 2D 8-18 |
| `VRCP28PD` | Approximation to the Reciprocal of Packed Double Precision Floating-Point Values With Less Than 2^-28 Relative Error | 2963 | Vol. 2D 8-20 |
| `VRCP28SD` | Approximation to the Reciprocal of Scalar Double Precision Floating-Point Value With Less Than 2^-28 Relative Error | 2965 | Vol. 2D 8-22 |
| `VRCP28PS` | Approximation to the Reciprocal of Packed Single Precision Floating-Point Values With Less Than 2^-28 Relative Error | 2967 | Vol. 2D 8-24 |
| `VRCP28SS` | Approximation to the Reciprocal of Scalar Single Precision Floating-Point Value With Less Than 2^-28 Relative Error | 2969 | Vol. 2D 8-26 |
| `VRSQRT28PD` | Approximation to the Reciprocal Square Root of Packed Double Precision Floating-Point Values With Less Than 2^-28 Relative Error | 2971 | Vol. 2D 8-28 |
| `VRSQRT28SD` | Approximation to the Reciprocal Square Root of Scalar Double Precision Floating-Point Value With Less Than 2^-28 Relative Error | 2973 | Vol. 2D 8-30 |
| `VRSQRT28PS` | Approximation to the Reciprocal Square Root of Packed Single Precision Floating-Point Values With Less Than 2^-28 Relative Error | 2975 | Vol. 2D 8-32 |
| `VRSQRT28SS` | Approximation to the Reciprocal Square Root of Scalar Single Precision Floating- Point Value With Less Than 2^-28 Relative Error | 2977 | Vol. 2D 8-34 |
| `VSCATTERPF0DPS/VSCATTERPF0QPS/VSCATTERPF0DPD/VSCATTERPF0QPD` | Sparse Prefetch Packed SP/DP Data Values with Signed Dword, Signed Qword Indices Using T0 Hint With Intent to Write | 2979 | Vol. 2D 8-36 |
| `VSCATTERPF1DPS/VSCATTERPF1QPS/VSCATTERPF1DPD/VSCATTERPF1QPD` | Sparse Prefetch Packed SP/DP Data Values With Signed Dword, Signed Qword Indices Using T1 Hint With Intent to Write | 2981 | Vol. 2D 8-38 |
