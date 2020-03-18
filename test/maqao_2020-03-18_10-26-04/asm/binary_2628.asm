0x991a8:::0::Insn: LEA	-0x1(%RCX),%RDX
0x991ac:::0::Insn: CMP	%R8,%RDX
0x991af:::0::Insn: JL	991d6 <hypre_BinarySearch+0x46>
0x991b1:::0::Insn: LEA	(%RDX,%R8,1),%RAX
0x991b5:::0::Insn: MOV	%RAX,%RCX
0x991b8:::0::Insn: SHR	$0x3f,%RCX
0x991bc:::0::Insn: ADD	%RAX,%RCX
0x991bf:::0::Insn: SAR	$0x1,%RCX
0x991c2:::0::Insn: CMP	%RSI,(%RDI,%RCX,8)
0x991c6:::0::Insn: MOV	%RCX,%RAX
0x991c9:::0::Insn: JG	991a8 <hypre_BinarySearch+0x18>
0x991cb:::0::Insn: JGE	991dd <hypre_BinarySearch+0x4d>
0x991cd:::0::Insn: LEA	0x1(%RCX),%R8
0x991d1:::0::Insn: CMP	%R8,%RDX
0x991d4:::0::Insn: JGE	991b1 <hypre_BinarySearch+0x21>
