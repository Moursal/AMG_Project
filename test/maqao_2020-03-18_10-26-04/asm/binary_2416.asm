0x87270:::0::Insn: MOV	(%R14,%RBX,8),%RAX
0x87274:::0::Insn: MOV	0x8(%R14,%RBX,8),%RCX
0x87279:::0::Insn: PXOR	%XMM1,%XMM1
0x8727d:::0::Insn: CMP	%RAX,%RCX
0x87280:::0::Insn: JLE	872a6 <hypre_CSRMatrixMatvecOutOfPlace._omp_fn.6+0x356>
0x87282:::0::Insn: NOPW	(%RAX,%RAX,1)
0x87288:::0::Insn: MOV	(%R12,%RAX,8),%RDX
0x8728c:::0::Insn: MOVSD	(%RBP,%RDX,8),%XMM0
0x87292:::0::Insn: MULSD	(%R13,%RAX,8),%XMM0
0x87299:::0::Insn: ADD	$0x1,%RAX
0x8729d:::0::Insn: CMP	%RAX,%RCX
0x872a0:::0::Insn: ADDSD	%XMM0,%XMM1
0x872a4:::0::Insn: JNE	87288 <hypre_CSRMatrixMatvecOutOfPlace._omp_fn.6+0x338>
0x872a6:::0::Insn: MOVSD	%XMM1,(%R15,%RBX,8)
0x872ac:::0::Insn: ADD	$0x1,%RBX
0x872b0:::0::Insn: CMP	%RBX,%R8
0x872b3:::0::Insn: JNE	87270 <hypre_CSRMatrixMatvecOutOfPlace._omp_fn.6+0x320>
