0x76128:::0::Insn: MOV	%R9,(%RSI)
0x7612b:::0::Insn: MOV	0x8(%RSP),%RSI
0x76130:::0::Insn: MOVSD	%XMM0,(%RDX,%R9,8)
0x76136:::0::Insn: ADD	$0x1,%RAX
0x7613a:::0::Insn: MOV	%RCX,(%RSI,%R9,8)
0x7613e:::0::Insn: ADD	$0x1,%R9
0x76142:::0::Insn: CMP	%RAX,(%R14)
0x76145:::0::Insn: JLE	7617e <hypre_ParMatmul._omp_fn.4+0x66e>
0x76147:::0::Insn: MOV	(%R15,%RAX,8),%RCX
0x7614b:::0::Insn: MOVSD	(%R10,%RAX,8),%XMM0
0x76151:::0::Insn: MULSD	%XMM1,%XMM0
0x76155:::0::Insn: MOV	(%R11,%RCX,8),%RCX
0x76159:::0::Insn: LEA	(%RBX,%RCX,1),%RSI
0x7615d:::0::Insn: LEA	(%RDI,%RSI,8),%RSI
0x76161:::0::Insn: MOV	(%RSI),%R8
0x76164:::0::Insn: CMP	%RBP,%R8
0x76167:::0::Insn: JL	76128 <hypre_ParMatmul._omp_fn.4+0x618>
0x76169:::0::Insn: LEA	(%RDX,%R8,8),%RCX
0x7616d:::0::Insn: ADD	$0x1,%RAX
0x76171:::0::Insn: CMP	%RAX,(%R14)
0x76174:::0::Insn: ADDSD	(%RCX),%XMM0
0x76178:::0::Insn: MOVSD	%XMM0,(%RCX)
0x7617c:::0::Insn: JG	76147 <hypre_ParMatmul._omp_fn.4+0x637>
