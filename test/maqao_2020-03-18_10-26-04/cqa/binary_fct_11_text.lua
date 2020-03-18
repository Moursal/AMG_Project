_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          details = "Calling (and then returning from) a function prevents many compiler optimizations (like vectorization), breaks control flow (which reduces pipeline performance) and executes extra instructions to save/restore the registers used inside it, which is very expensive (dozens of cycles). Consider to inline small functions.\n - @plt_start@: 2 occurrences\n",
          title = "CALL instructions",
          txt = "Detected function call instructions.\n",
        },
        {
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n - IDIV: 1 occurrences\n",
          title = "Complex instructions",
          txt = "Detected COMPLEX INSTRUCTIONS.\n",
        },
        {
          title = "Type of elements and instruction set",
          txt = "No instructions are processing arithmetic or math operations on FP elements. This function is probably writing/copying data or processing integer elements.",
        },
        {
          title = "Matching between your function (in the source code) and the binary function",
          txt = "The binary function does not contain any FP arithmetical operations.\nThe binary function is loading 16 bytes.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 9a350\n\nInstruction                                            | Nb FU | P0    | P1    | P2   | P3   | P4 | P5    | P6    | P7   | Latency | Recip. throughput\n------------------------------------------------------------------------------------------------------------------------------------------------------\nPUSH %RBP                                              | 1     | 0     | 0     | 0.33 | 0.33 | 1  | 0     | 0     | 0.33 | 3       | 1\nPUSH %RBX                                              | 1     | 0     | 0     | 0.33 | 0.33 | 1  | 0     | 0     | 0.33 | 3       | 1\nMOV %RDI,%RBP                                          | 1     | 0     | 0     | 0    | 0    | 0  | 0     | 0     | 0    | 0       | 0.25\nSUB $0x8,%RSP                                          | 1     | 0.25  | 0.25  | 0    | 0    | 0  | 0.25  | 0.25  | 0    | 1       | 0.25\nCALL 20f0 <@plt_start@+0x80>                           | 2     | 0     | 0     | 0.33 | 0.33 | 1  | 0     | 1     | 0.33 | 0       | 2\nMOV %EAX,%EBX                                          | 1     | 0     | 0     | 0    | 0    | 0  | 0     | 0     | 0    | 0       | 0.25\nCALL 2240 <@plt_start@+0x1d0>                          | 2     | 0     | 0     | 0.33 | 0.33 | 1  | 0     | 1     | 0.33 | 0       | 2\nMOVSXD %EAX,%RCX                                       | 1     | 0.25  | 0.25  | 0    | 0    | 0  | 0.25  | 0.25  | 0    | 1       | 0.25\nMOV 0x8(%RBP),%RAX                                     | 1     | 0     | 0     | 0.50 | 0.50 | 0  | 0     | 0     | 0    | 2       | 0.50\nMOVSXD %EBX,%RSI                                       | 1     | 0.25  | 0.25  | 0    | 0    | 0  | 0.25  | 0.25  | 0    | 1       | 0.25\nCQTO\nIDIV %RSI                                              | 59    | 14.75 | 14.75 | 0    | 0    | 0  | 14.75 | 14.75 | 0    | 39-103  | 24-81\nCMP %RDX,%RCX                                          | 1     | 0.25  | 0.25  | 0    | 0    | 0  | 0.25  | 0.25  | 0    | 1       | 0.25\nJGE 9a37f <hypre_UnorderedIntMapCreate._omp_fn.1+0x2f> | 1     | 0.50  | 0     | 0    | 0    | 0  | 0     | 0.50  | 0    | 0       | 0.50-1\nADD $0x1,%RAX                                          | 1     | 0.25  | 0.25  | 0    | 0    | 0  | 0.25  | 0.25  | 0    | 1       | 0.25\nXOR %EDX,%EDX                                          | 1     | 0     | 0     | 0    | 0    | 0  | 0     | 0     | 0    | 0       | 0.25\nIMUL %RAX,%RCX                                         | 1     | 0     | 1     | 0    | 0    | 0  | 0     | 0     | 0    | 3       | 1\nADD %RCX,%RDX                                          | 1     | 0.25  | 0.25  | 0    | 0    | 0  | 0.25  | 0.25  | 0    | 1       | 0.25\nADD %RDX,%RAX                                          | 1     | 0.25  | 0.25  | 0    | 0    | 0  | 0.25  | 0.25  | 0    | 1       | 0.25\nCMP %RAX,%RDX                                          | 1     | 0.25  | 0.25  | 0    | 0    | 0  | 0.25  | 0.25  | 0    | 1       | 0.25\nJGE 9a3c2 <hypre_UnorderedIntMapCreate._omp_fn.1+0x72> | 1     | 0.50  | 0     | 0    | 0    | 0  | 0     | 0.50  | 0    | 0       | 0.50-1\nMOV (%RBP),%RDI                                        | 1     | 0     | 0     | 0.50 | 0.50 | 0  | 0     | 0     | 0    | 2       | 0.50\nMOV %RDX,%RSI                                          | 1     | 0     | 0     | 0    | 0    | 0  | 0     | 0     | 0    | 0       | 0.25\nSAL $0x5,%RSI                                          | 1     | 0.50  | 0     | 0    | 0    | 0  | 0     | 0.50  | 0    | 1       | 0.50\nNOPL (%RAX)                                            | 1     | 0     | 0     | 0    | 0    | 0  | 0     | 0     | 0    | 0       | 0.25\nADD $0x8,%RSP                                          | 1     | 0.25  | 0.25  | 0    | 0    | 0  | 0.25  | 0.25  | 0    | 1       | 0.25\nPOP %RBX                                               | 1     | 0     | 0     | 0.50 | 0.50 | 0  | 0     | 0     | 0    | 2       | 0.50\nPOP %RBP                                               | 1     | 0     | 0     | 0.50 | 0.50 | 0  | 0     | 0     | 0    | 2       | 0.50\nRET                                                    | 1     | 0     | 0     | 0.33 | 0.33 | 0  | 0     | 1     | 0.33 | 0       | 1\nNOPL (%RAX)                                            | 1     | 0     | 0     | 0    | 0    | 0  | 0     | 0     | 0    | 0       | 0.25\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 30\nnb uops            : 89\nloop length        : 94\nused x86 registers : 8\nused mmx registers : 0\nused xmm registers : 0\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 2\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nFIT IN UOP CACHE\nmicro-operation queue: 22.25 cycles\nfront end            : 22.25 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2   | P3   | P4   | P5    | P6    | P7\n------------------------------------------------------------------\nuops   | 18.75 | 18.75 | 3.00 | 3.00 | 4.00 | 18.75 | 18.75 | 3.00\ncycles | 18.75 | 18.75 | 3.00 | 3.00 | 4.00 | 18.75 | 18.75 | 3.00\n\nCycles executing div or sqrt instructions: 24.00-81.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 22.25\nDispatch  : 18.75\nDIV/SQRT  : 24.00-81.00\nOverall L1: 24.00-81.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all    : 0%\nload   : 0%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : 0%\nadd-sub: 0%\nother  : 0%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all    : 23%\nload   : 25%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : 25%\nadd-sub: 25%\nother  : 23%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 81.00 cycles. At this rate:\n - 0% of peak load performance is reached (0.20 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
      },
      header = {
        "Warnings:\n - The number of fused uops of the instruction [CQTO] is unknown\n - Detected a function call instruction: ignoring called function instructions.\nRerun with --follow-calls=append to include them to analysis  or with --follow-calls=inline to simulate inlining.\n",
        "0% of peak computational performance is used (0.00 out of 4.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try another compiler or update/tune your current one\n - Make array accesses unit-stride:\n  * If your function streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized function can use their full power.\n",
          title = "Vectorization",
          txt = "Your function is not vectorized.\nOnly 23% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your function, you can lower the cost of an iteration from 81.00 to 40.50 cycles (2.00x speedup).",
        },
        {
          workaround = "Reduce the number of division or square root instructions:\n - If denominator is constant over iterations, use reciprocal (replace x/y with x*(1/y)). Check precision impact.\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by execution of divide and square root operations (the divide/square root unit is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 81.00 to 22.25 cycles (3.64x speedup).\n",
        },
      },
      potential = {
      },
    },
  },
  AVG = {
      hint = {
        {
          details = "Calling (and then returning from) a function prevents many compiler optimizations (like vectorization), breaks control flow (which reduces pipeline performance) and executes extra instructions to save/restore the registers used inside it, which is very expensive (dozens of cycles). Consider to inline small functions.\n - @plt_start@: 2 occurrences\n",
          title = "CALL instructions",
          txt = "Detected function call instructions.\n",
        },
        {
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n - IDIV: 1 occurrences\n",
          title = "Complex instructions",
          txt = "Detected COMPLEX INSTRUCTIONS.\n",
        },
        {
          title = "Type of elements and instruction set",
          txt = "No instructions are processing arithmetic or math operations on FP elements. This function is probably writing/copying data or processing integer elements.",
        },
        {
          title = "Matching between your function (in the source code) and the binary function",
          txt = "The binary function does not contain any FP arithmetical operations.\nThe binary function is loading 16 bytes.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 9a350\n\nInstruction                                            | Nb FU | P0    | P1    | P2   | P3   | P4 | P5    | P6    | P7   | Latency | Recip. throughput\n------------------------------------------------------------------------------------------------------------------------------------------------------\nPUSH %RBP                                              | 1     | 0     | 0     | 0.33 | 0.33 | 1  | 0     | 0     | 0.33 | 3       | 1\nPUSH %RBX                                              | 1     | 0     | 0     | 0.33 | 0.33 | 1  | 0     | 0     | 0.33 | 3       | 1\nMOV %RDI,%RBP                                          | 1     | 0     | 0     | 0    | 0    | 0  | 0     | 0     | 0    | 0       | 0.25\nSUB $0x8,%RSP                                          | 1     | 0.25  | 0.25  | 0    | 0    | 0  | 0.25  | 0.25  | 0    | 1       | 0.25\nCALL 20f0 <@plt_start@+0x80>                           | 2     | 0     | 0     | 0.33 | 0.33 | 1  | 0     | 1     | 0.33 | 0       | 2\nMOV %EAX,%EBX                                          | 1     | 0     | 0     | 0    | 0    | 0  | 0     | 0     | 0    | 0       | 0.25\nCALL 2240 <@plt_start@+0x1d0>                          | 2     | 0     | 0     | 0.33 | 0.33 | 1  | 0     | 1     | 0.33 | 0       | 2\nMOVSXD %EAX,%RCX                                       | 1     | 0.25  | 0.25  | 0    | 0    | 0  | 0.25  | 0.25  | 0    | 1       | 0.25\nMOV 0x8(%RBP),%RAX                                     | 1     | 0     | 0     | 0.50 | 0.50 | 0  | 0     | 0     | 0    | 2       | 0.50\nMOVSXD %EBX,%RSI                                       | 1     | 0.25  | 0.25  | 0    | 0    | 0  | 0.25  | 0.25  | 0    | 1       | 0.25\nCQTO\nIDIV %RSI                                              | 59    | 14.75 | 14.75 | 0    | 0    | 0  | 14.75 | 14.75 | 0    | 39-103  | 24-81\nCMP %RDX,%RCX                                          | 1     | 0.25  | 0.25  | 0    | 0    | 0  | 0.25  | 0.25  | 0    | 1       | 0.25\nJGE 9a37f <hypre_UnorderedIntMapCreate._omp_fn.1+0x2f> | 1     | 0.50  | 0     | 0    | 0    | 0  | 0     | 0.50  | 0    | 0       | 0.50-1\nADD $0x1,%RAX                                          | 1     | 0.25  | 0.25  | 0    | 0    | 0  | 0.25  | 0.25  | 0    | 1       | 0.25\nXOR %EDX,%EDX                                          | 1     | 0     | 0     | 0    | 0    | 0  | 0     | 0     | 0    | 0       | 0.25\nIMUL %RAX,%RCX                                         | 1     | 0     | 1     | 0    | 0    | 0  | 0     | 0     | 0    | 3       | 1\nADD %RCX,%RDX                                          | 1     | 0.25  | 0.25  | 0    | 0    | 0  | 0.25  | 0.25  | 0    | 1       | 0.25\nADD %RDX,%RAX                                          | 1     | 0.25  | 0.25  | 0    | 0    | 0  | 0.25  | 0.25  | 0    | 1       | 0.25\nCMP %RAX,%RDX                                          | 1     | 0.25  | 0.25  | 0    | 0    | 0  | 0.25  | 0.25  | 0    | 1       | 0.25\nJGE 9a3c2 <hypre_UnorderedIntMapCreate._omp_fn.1+0x72> | 1     | 0.50  | 0     | 0    | 0    | 0  | 0     | 0.50  | 0    | 0       | 0.50-1\nMOV (%RBP),%RDI                                        | 1     | 0     | 0     | 0.50 | 0.50 | 0  | 0     | 0     | 0    | 2       | 0.50\nMOV %RDX,%RSI                                          | 1     | 0     | 0     | 0    | 0    | 0  | 0     | 0     | 0    | 0       | 0.25\nSAL $0x5,%RSI                                          | 1     | 0.50  | 0     | 0    | 0    | 0  | 0     | 0.50  | 0    | 1       | 0.50\nNOPL (%RAX)                                            | 1     | 0     | 0     | 0    | 0    | 0  | 0     | 0     | 0    | 0       | 0.25\nADD $0x8,%RSP                                          | 1     | 0.25  | 0.25  | 0    | 0    | 0  | 0.25  | 0.25  | 0    | 1       | 0.25\nPOP %RBX                                               | 1     | 0     | 0     | 0.50 | 0.50 | 0  | 0     | 0     | 0    | 2       | 0.50\nPOP %RBP                                               | 1     | 0     | 0     | 0.50 | 0.50 | 0  | 0     | 0     | 0    | 2       | 0.50\nRET                                                    | 1     | 0     | 0     | 0.33 | 0.33 | 0  | 0     | 1     | 0.33 | 0       | 1\nNOPL (%RAX)                                            | 1     | 0     | 0     | 0    | 0    | 0  | 0     | 0     | 0    | 0       | 0.25\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 30\nnb uops            : 89\nloop length        : 94\nused x86 registers : 8\nused mmx registers : 0\nused xmm registers : 0\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 2\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nFIT IN UOP CACHE\nmicro-operation queue: 22.25 cycles\nfront end            : 22.25 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2   | P3   | P4   | P5    | P6    | P7\n------------------------------------------------------------------\nuops   | 18.75 | 18.75 | 3.00 | 3.00 | 4.00 | 18.75 | 18.75 | 3.00\ncycles | 18.75 | 18.75 | 3.00 | 3.00 | 4.00 | 18.75 | 18.75 | 3.00\n\nCycles executing div or sqrt instructions: 24.00-81.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 22.25\nDispatch  : 18.75\nDIV/SQRT  : 24.00-81.00\nOverall L1: 24.00-81.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all    : 0%\nload   : 0%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : 0%\nadd-sub: 0%\nother  : 0%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all    : 23%\nload   : 25%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : 25%\nadd-sub: 25%\nother  : 23%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 81.00 cycles. At this rate:\n - 0% of peak load performance is reached (0.20 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
      },
      header = {
        "Warnings:\n - The number of fused uops of the instruction [CQTO] is unknown\n - Detected a function call instruction: ignoring called function instructions.\nRerun with --follow-calls=append to include them to analysis  or with --follow-calls=inline to simulate inlining.\n",
        "0% of peak computational performance is used (0.00 out of 4.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try another compiler or update/tune your current one\n - Make array accesses unit-stride:\n  * If your function streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized function can use their full power.\n",
          title = "Vectorization",
          txt = "Your function is not vectorized.\nOnly 23% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your function, you can lower the cost of an iteration from 81.00 to 40.50 cycles (2.00x speedup).",
        },
        {
          workaround = "Reduce the number of division or square root instructions:\n - If denominator is constant over iterations, use reciprocal (replace x/y with x*(1/y)). Check precision impact.\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by execution of divide and square root operations (the divide/square root unit is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 81.00 to 22.25 cycles (3.64x speedup).\n",
        },
      },
      potential = {
      },
    },
  common = {
    header = {
      "",
      "Warnings:\nIgnoring paths for analysis",
    },
    nb_paths = 1,
  },
}
