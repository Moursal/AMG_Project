0x68fb8:::0::Insn: MOVSD	(%RAX),%XMM0
0x68fbc:::0::Insn: ADD	$0x8,%RAX
0x68fc0:::0::Insn: CMP	%RAX,%RCX
0x68fc3:::0::Insn: ANDPD	%XMM4,%XMM0
0x68fc7:::0::Insn: ADDSD	%XMM0,%XMM1
0x68fcb:::0::Insn: MOVSD	%XMM1,(%RDX)
0x68fcf:::0::Insn: JNE	68fb8 <hypre_ParCSRComputeL1Norms+0x448>
