_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          details = "Calling (and then returning from) a function prevents many compiler optimizations (like vectorization), breaks control flow (which reduces pipeline performance) and executes extra instructions to save/restore the registers used inside it, which is very expensive (dozens of cycles). Consider to inline small functions.\n - hypre_NumActiveThreads: 1 occurrences\n",
          title = "CALL instructions",
          txt = "Detected function call instructions.\n",
        },
        {
          title = "Type of elements and instruction set",
          txt = "No instructions are processing arithmetic or math operations on FP elements. This function is probably writing/copying data or processing integer elements.",
        },
        {
          title = "Matching between your function (in the source code) and the binary function",
          txt = "The binary function does not contain any FP arithmetical operations.\nThe binary function is loading 24 bytes.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 85b80\n\nInstruction                                                      | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7   | Latency | Recip. throughput\n------------------------------------------------------------------------------------------------------------------------------------------------------------\nPUSH %R13                                                        | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nPUSH %R12                                                        | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nPUSH %RBP                                                        | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nPUSH %RBX                                                        | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOV %RSI,%RBP                                                    | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nSUB $0x8,%RSP                                                    | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nMOV 0x20(%RDI),%R13                                              | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nMOV 0x10(%RDI),%RBX                                              | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nMOV (%RDI),%R12                                                  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nCALL 9dae0 <hypre_NumActiveThreads>                              | 2     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 1    | 0.33 | 0       | 2\nTEST %RBP,%RBP                                                   | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJLE 85bf8 <hypre_CSRMatrixGetLoadBalancedPartitionBoundary+0x78> | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\nADD $0x8,%RSP                                                    | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nXOR %EBX,%EBX                                                    | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nMOV %RBX,%RAX                                                    | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nPOP %RBX                                                         | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nPOP %RBP                                                         | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nPOP %R12                                                         | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nPOP %R13                                                         | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nRET                                                              | 1     | 0    | 0    | 0.33 | 0.33 | 0  | 0    | 1    | 0.33 | 0       | 1\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 20\nnb uops            : 21\nloop length        : 50\nused x86 registers : 8\nused mmx registers : 0\nused xmm registers : 0\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nFIT IN UOP CACHE\nmicro-operation queue: 5.25 cycles\nfront end            : 5.25 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7\n--------------------------------------------------------------\nuops   | 1.50 | 1.25 | 4.50 | 4.17 | 5.00 | 1.25 | 2.00 | 4.33\ncycles | 1.50 | 1.25 | 4.50 | 4.17 | 5.00 | 1.25 | 2.00 | 4.33\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 5.25\nDispatch  : 5.00\nOverall L1: 5.25\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all    : 0%\nload   : 0%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 0%\nother  : 0%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all    : 23%\nload   : 25%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 25%\nother  : 18%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 5.25 cycles. At this rate:\n - 7% of peak load performance is reached (4.57 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 5.25 to 5.00 cycles (1.05x speedup).\n",
        },
      },
      header = {
        "Warnings:\nDetected a function call instruction: ignoring called function instructions.\nRerun with --follow-calls=append to include them to analysis  or with --follow-calls=inline to simulate inlining.",
        "0% of peak computational performance is used (0.00 out of 4.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try another compiler or update/tune your current one\n - Make array accesses unit-stride:\n  * If your function streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized function can use their full power.\n",
          title = "Vectorization",
          txt = "Your function is not vectorized.\nOnly 23% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your function, you can lower the cost of an iteration from 5.25 to 0.82 cycles (6.40x speedup).",
        },
        {
          title = "Execution units bottlenecks",
          txt = "Found no such bottlenecks but see expert reports for more complex bottlenecks.",
        },
      },
      potential = {
      },
    },
    {
      hint = {
        {
          details = "Calling (and then returning from) a function prevents many compiler optimizations (like vectorization), breaks control flow (which reduces pipeline performance) and executes extra instructions to save/restore the registers used inside it, which is very expensive (dozens of cycles). Consider to inline small functions.\n - hypre_NumActiveThreads: 1 occurrences\n",
          title = "CALL instructions",
          txt = "Detected function call instructions.\n",
        },
        {
          title = "Type of elements and instruction set",
          txt = "No instructions are processing arithmetic or math operations on FP elements. This function is probably writing/copying data or processing integer elements.",
        },
        {
          title = "Matching between your function (in the source code) and the binary function",
          txt = "The binary function does not contain any FP arithmetical operations.\nThe binary function is loading 24 bytes.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 85b80\n\nInstruction                                                      | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7   | Latency | Recip. throughput\n------------------------------------------------------------------------------------------------------------------------------------------------------------\nPUSH %R13                                                        | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nPUSH %R12                                                        | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nPUSH %RBP                                                        | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nPUSH %RBX                                                        | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOV %RSI,%RBP                                                    | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nSUB $0x8,%RSP                                                    | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nMOV 0x20(%RDI),%R13                                              | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nMOV 0x10(%RDI),%RBX                                              | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nMOV (%RDI),%R12                                                  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nCALL 9dae0 <hypre_NumActiveThreads>                              | 2     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 1    | 0.33 | 0       | 2\nTEST %RBP,%RBP                                                   | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJLE 85bf8 <hypre_CSRMatrixGetLoadBalancedPartitionBoundary+0x78> | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\nCMP %RBP,%RAX                                                    | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nMOV %RAX,%RCX                                                    | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nJG 85bc0 <hypre_CSRMatrixGetLoadBalancedPartitionBoundary+0x40>  | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\nADD $0x8,%RSP                                                    | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nMOV %RBX,%RAX                                                    | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nPOP %RBX                                                         | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nPOP %RBP                                                         | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nPOP %R12                                                         | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nPOP %R13                                                         | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nRET                                                              | 1     | 0    | 0    | 0.33 | 0.33 | 0  | 0    | 1    | 0.33 | 0       | 1\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 22\nnb uops            : 23\nloop length        : 56\nused x86 registers : 9\nused mmx registers : 0\nused xmm registers : 0\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nFIT IN UOP CACHE\nmicro-operation queue: 5.75 cycles\nfront end            : 5.75 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7\n--------------------------------------------------------------\nuops   | 2.00 | 2.00 | 4.50 | 4.17 | 5.00 | 2.00 | 2.00 | 4.33\ncycles | 2.00 | 2.00 | 4.50 | 4.17 | 5.00 | 2.00 | 2.00 | 4.33\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 5.75\nDispatch  : 5.00\nOverall L1: 5.75\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all    : 0%\nload   : 0%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 0%\nother  : 0%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all    : 25%\nload   : 25%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 25%\nother  : 25%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 5.75 cycles. At this rate:\n - 6% of peak load performance is reached (4.17 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 5.75 to 5.00 cycles (1.15x speedup).\n",
        },
      },
      header = {
        "Warnings:\nDetected a function call instruction: ignoring called function instructions.\nRerun with --follow-calls=append to include them to analysis  or with --follow-calls=inline to simulate inlining.",
        "0% of peak computational performance is used (0.00 out of 4.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try another compiler or update/tune your current one\n - Make array accesses unit-stride:\n  * If your function streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized function can use their full power.\n",
          title = "Vectorization",
          txt = "Your function is not vectorized.\n4 data elements could be processed at once in vector registers.\nBy vectorizing your function, you can lower the cost of an iteration from 5.75 to 1.44 cycles (4.00x speedup).",
        },
        {
          title = "Execution units bottlenecks",
          txt = "Found no such bottlenecks but see expert reports for more complex bottlenecks.",
        },
      },
      potential = {
      },
    },
    {
      hint = {
        {
          details = "Calling (and then returning from) a function prevents many compiler optimizations (like vectorization), breaks control flow (which reduces pipeline performance) and executes extra instructions to save/restore the registers used inside it, which is very expensive (dozens of cycles). Consider to inline small functions.\n - hypre_LowerBound: 1 occurrences\n - hypre_NumActiveThreads: 1 occurrences\n",
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
          txt = "The binary function does not contain any FP arithmetical operations.\nThe binary function is loading 24 bytes.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 85b80\n\nInstruction                                                      | Nb FU | P0    | P1    | P2   | P3   | P4 | P5    | P6    | P7   | Latency | Recip. throughput\n----------------------------------------------------------------------------------------------------------------------------------------------------------------\nPUSH %R13                                                        | 1     | 0     | 0     | 0.33 | 0.33 | 1  | 0     | 0     | 0.33 | 3       | 1\nPUSH %R12                                                        | 1     | 0     | 0     | 0.33 | 0.33 | 1  | 0     | 0     | 0.33 | 3       | 1\nPUSH %RBP                                                        | 1     | 0     | 0     | 0.33 | 0.33 | 1  | 0     | 0     | 0.33 | 3       | 1\nPUSH %RBX                                                        | 1     | 0     | 0     | 0.33 | 0.33 | 1  | 0     | 0     | 0.33 | 3       | 1\nMOV %RSI,%RBP                                                    | 1     | 0     | 0     | 0    | 0    | 0  | 0     | 0     | 0    | 0       | 0.25\nSUB $0x8,%RSP                                                    | 1     | 0.25  | 0.25  | 0    | 0    | 0  | 0.25  | 0.25  | 0    | 1       | 0.25\nMOV 0x20(%RDI),%R13                                              | 1     | 0     | 0     | 0.50 | 0.50 | 0  | 0     | 0     | 0    | 2       | 0.50\nMOV 0x10(%RDI),%RBX                                              | 1     | 0     | 0     | 0.50 | 0.50 | 0  | 0     | 0     | 0    | 2       | 0.50\nMOV (%RDI),%R12                                                  | 1     | 0     | 0     | 0.50 | 0.50 | 0  | 0     | 0     | 0    | 2       | 0.50\nCALL 9dae0 <hypre_NumActiveThreads>                              | 2     | 0     | 0     | 0.33 | 0.33 | 1  | 0     | 1     | 0.33 | 0       | 2\nTEST %RBP,%RBP                                                   | 1     | 0.25  | 0.25  | 0    | 0    | 0  | 0.25  | 0.25  | 0    | 1       | 0.25\nJLE 85bf8 <hypre_CSRMatrixGetLoadBalancedPartitionBoundary+0x78> | 1     | 0.50  | 0     | 0    | 0    | 0  | 0     | 0.50  | 0    | 0       | 0.50-1\nCMP %RBP,%RAX                                                    | 1     | 0.25  | 0.25  | 0    | 0    | 0  | 0.25  | 0.25  | 0    | 1       | 0.25\nMOV %RAX,%RCX                                                    | 1     | 0     | 0     | 0    | 0    | 0  | 0     | 0     | 0    | 0       | 0.25\nJG 85bc0 <hypre_CSRMatrixGetLoadBalancedPartitionBoundary+0x40>  | 1     | 0.50  | 0     | 0    | 0    | 0  | 0     | 0.50  | 0    | 0       | 0.50-1\nLEA -0x1(%R13,%RAX,1),%RAX                                       | 1     | 0     | 1     | 0    | 0    | 0  | 0     | 0     | 0    | 3       | 1\nLEA (%R12,%RBX,8),%RSI                                           | 1     | 0     | 0.50  | 0    | 0    | 0  | 0.50  | 0     | 0    | 1       | 0.50\nMOV %R12,%RDI                                                    | 1     | 0     | 0     | 0    | 0    | 0  | 0     | 0     | 0    | 0       | 0.25\nCQTO\nIDIV %RCX                                                        | 59    | 14.75 | 14.75 | 0    | 0    | 0  | 14.75 | 14.75 | 0    | 39-103  | 24-81\nIMUL %RBP,%RAX                                                   | 1     | 0     | 1     | 0    | 0    | 0  | 0     | 0     | 0    | 3       | 1\nMOV %RAX,%RDX                                                    | 1     | 0     | 0     | 0    | 0    | 0  | 0     | 0     | 0    | 0       | 0.25\nCALL 99230 <hypre_LowerBound>                                    | 2     | 0     | 0     | 0.33 | 0.33 | 1  | 0     | 1     | 0.33 | 0       | 2\nSUB %R12,%RAX                                                    | 1     | 0.25  | 0.25  | 0    | 0    | 0  | 0.25  | 0.25  | 0    | 1       | 0.25\nADD $0x8,%RSP                                                    | 1     | 0.25  | 0.25  | 0    | 0    | 0  | 0.25  | 0.25  | 0    | 1       | 0.25\nMOV %RAX,%RBX                                                    | 1     | 0     | 0     | 0    | 0    | 0  | 0     | 0     | 0    | 0       | 0.25\nSAR $0x3,%RBX                                                    | 1     | 0.50  | 0     | 0    | 0    | 0  | 0     | 0.50  | 0    | 1       | 0.50\nMOV %RBX,%RAX                                                    | 1     | 0     | 0     | 0    | 0    | 0  | 0     | 0     | 0    | 0       | 0.25\nPOP %RBX                                                         | 1     | 0     | 0     | 0.50 | 0.50 | 0  | 0     | 0     | 0    | 2       | 0.50\nPOP %RBP                                                         | 1     | 0     | 0     | 0.50 | 0.50 | 0  | 0     | 0     | 0    | 2       | 0.50\nPOP %R12                                                         | 1     | 0     | 0     | 0.50 | 0.50 | 0  | 0     | 0     | 0    | 2       | 0.50\nPOP %R13                                                         | 1     | 0     | 0     | 0.50 | 0.50 | 0  | 0     | 0     | 0    | 2       | 0.50\nRET                                                              | 1     | 0     | 0     | 0.33 | 0.33 | 0  | 0     | 1     | 0.33 | 0       | 1\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 33\nnb uops            : 92\nloop length        : 95\nused x86 registers : 10\nused mmx registers : 0\nused xmm registers : 0\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nFIT IN UOP CACHE\nmicro-operation queue: 23.00 cycles\nfront end            : 23.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2   | P3   | P4   | P5    | P6    | P7\n------------------------------------------------------------------\nuops   | 18.25 | 18.25 | 4.83 | 4.50 | 6.00 | 18.25 | 18.25 | 4.67\ncycles | 18.25 | 18.25 | 4.83 | 4.50 | 6.00 | 18.25 | 18.25 | 4.67\n\nCycles executing div or sqrt instructions: 24.00-81.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 23.00\nDispatch  : 18.25\nDIV/SQRT  : 24.00-81.00\nOverall L1: 24.00-81.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all    : 0%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 0%\nother  : 0%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all    : 25%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 25%\nother  : 25%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 81.00 cycles. At this rate:\n - 0% of peak load performance is reached (0.30 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
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
          txt = "Your function is not vectorized.\n4 data elements could be processed at once in vector registers.\nBy vectorizing your function, you can lower the cost of an iteration from 81.00 to 40.50 cycles (2.00x speedup).",
        },
        {
          workaround = "Reduce the number of division or square root instructions:\n - If denominator is constant over iterations, use reciprocal (replace x/y with x*(1/y)). Check precision impact.\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by execution of divide and square root operations (the divide/square root unit is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 81.00 to 23.00 cycles (3.52x speedup).\n",
        },
      },
      potential = {
      },
    },
  },
  AVG = {
      hint = {
        {
          details = "Calling (and then returning from) a function prevents many compiler optimizations (like vectorization), breaks control flow (which reduces pipeline performance) and executes extra instructions to save/restore the registers used inside it, which is very expensive (dozens of cycles). Consider to inline small functions.\n - hypre_NumActiveThreads: 1 occurrences\n",
          title = "CALL instructions",
          txt = "Detected function call instructions.\n",
        },
        {
          title = "Type of elements and instruction set",
          txt = "No instructions are processing arithmetic or math operations on FP elements. This function is probably writing/copying data or processing integer elements.",
        },
        {
          title = "Matching between your function (in the source code) and the binary function",
          txt = "The binary function does not contain any FP arithmetical operations.\nThe binary function is loading 24 bytes.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 25\nnb uops            : 45.33\nloop length        : 67\nused x86 registers : 9\nused mmx registers : 0\nused xmm registers : 0\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nfront end: 11.33 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7\n--------------------------------------------------------------\nuops   | 7.25 | 7.17 | 4.61 | 4.28 | 5.33 | 7.17 | 7.42 | 4.44\ncycles | 7.25 | 7.17 | 4.61 | 4.28 | 5.33 | 7.17 | 7.42 | 4.44\n\nCycles executing div or sqrt instructions: 8.00-27.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 11.33\nDispatch  : 9.42\nDIV/SQRT  : 8.00-27.00\nOverall L1: 11.67-30.67\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all    : 0%\nload   : 0%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 0%\nother  : 0%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all    : 24%\nload   : 25%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 25%\nother  : 22%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 30.67 cycles. At this rate:\n - 4% of peak load performance is reached (3.01 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
        },
      },
      header = {
        "0% of peak computational performance is used (0.00 out of 4.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try another compiler or update/tune your current one\n - Make array accesses unit-stride:\n  * If your function streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized function can use their full power.\n",
          title = "Vectorization",
          txt = "Your function is not vectorized.\nOnly 24% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your function, you can lower the cost of an iteration from 30.67 to 14.25 cycles (2.15x speedup).",
        },
      },
      potential = {
      },
    },
  common = {
    header = {
      "",
      "This function has 3 execution paths.\n",
      "The presence of multiple execution paths is typically the main/first bottleneck.\nTry to simplify control inside function: ideally, try to remove all conditional expressions, for example by (if applicable):\n - hoisting them (moving them outside the function)\n - turning them into conditional moves, MIN or MAX\n\n",
    },
    nb_paths = 3,
  },
}
