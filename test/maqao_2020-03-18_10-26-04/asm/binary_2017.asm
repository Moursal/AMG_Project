0x75680:::0::Insn: MOV	(%R15,%R11,8),%RAX
0x75684:::0::Insn: MOV	0x10(%RSP),%RCX
0x75689:::0::Insn: LEA	(,%RAX,8),%R13
0x75691:::0::Insn: MOV	(%RCX,%RAX,8),%RAX
0x75695:::0::Insn: LEA	0x8(%R13),%R9
0x75699:::0::Insn: ADD	%R9,%RCX
0x7569c:::0::Insn: CMP	(%RCX),%RAX
0x7569f:::0::Insn: JGE	756c6 <hypre_ParMatmul_RowSizes._omp_fn.0+0x256>
0x756a1:::0::Insn: NOPL	(%RAX)
0x756a8:::0::Insn: MOV	(%RBP,%RAX,8),%RDX
0x756ad:::0::Insn: LEA	(%RDI,%RDX,8),%RDX
0x756b1:::0::Insn: CMP	%RBX,(%RDX)
0x756b4:::0::Insn: JGE	756bd <hypre_ParMatmul_RowSizes._omp_fn.0+0x24d>
0x756b6:::0::Insn: MOV	%RSI,(%RDX)
0x756b9:::0::Insn: ADD	$0x1,%RSI
0x756bd:::0::Insn: ADD	$0x1,%RAX
0x756c1:::0::Insn: CMP	%RAX,(%RCX)
0x756c4:::0::Insn: JG	756a8 <hypre_ParMatmul_RowSizes._omp_fn.0+0x238>
0x756c6:::0::Insn: CMPQ	$0,0x8(%RSP)
0x756cc:::0::Insn: JNE	75828 <hypre_ParMatmul_RowSizes._omp_fn.0+0x3b8>
0x756d2:::0::Insn: MOV	(%RSP),%RAX
0x756d6:::0::Insn: ADD	$0x1,%R11
0x756da:::0::Insn: CMP	%R11,(%RAX)
0x756dd:::0::Insn: JG	75680 <hypre_ParMatmul_RowSizes._omp_fn.0+0x210>
0x75828:::0::Insn: MOV	0x38(%RSP),%RCX
0x7582d:::0::Insn: ADD	%RCX,%R9
0x75830:::0::Insn: MOV	(%RCX,%R13,1),%RAX
0x75834:::0::Insn: CMP	(%R9),%RAX
0x75837:::0::Insn: JGE	756d2 <hypre_ParMatmul_RowSizes._omp_fn.0+0x262>
0x7583d:::0::Insn: MOV	0x40(%RSP),%RCX
0x75842:::0::Insn: NOPW	(%RAX,%RAX,1)
0x75848:::0::Insn: MOV	(%R14,%RAX,8),%RDX
0x7584c:::0::Insn: MOV	(%RCX,%RDX,8),%R13
0x75850:::0::Insn: ADD	%R12,%R13
0x75853:::0::Insn: LEA	(%RDI,%R13,8),%RDX
0x75857:::0::Insn: CMP	%R10,(%RDX)
0x7585a:::0::Insn: JGE	75863 <hypre_ParMatmul_RowSizes._omp_fn.0+0x3f3>
0x7585c:::0::Insn: MOV	%R8,(%RDX)
0x7585f:::0::Insn: ADD	$0x1,%R8
0x75863:::0::Insn: ADD	$0x1,%RAX
0x75867:::0::Insn: CMP	%RAX,(%R9)
0x7586a:::0::Insn: JG	75848 <hypre_ParMatmul_RowSizes._omp_fn.0+0x3d8>
0x7586c:::0::Insn: JMP	756d2 <hypre_ParMatmul_RowSizes._omp_fn.0+0x262>
