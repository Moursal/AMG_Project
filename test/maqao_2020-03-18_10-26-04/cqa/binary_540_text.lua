_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          title = "Type of elements and instruction set",
          txt = "1 SSE or AVX instructions are processing arithmetic or math operations on double precision FP elements in scalar mode (one at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 1 FP arithmetical operations:\n - 1: addition or subtraction\nThe binary loop is loading 136 bytes (17 double precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.01 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 2ac96\n\nInstruction                                                | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7 | Latency | Recip. throughput\n----------------------------------------------------------------------------------------------------------------------------------------------------\nMOV 0x20(%RSP),%RDI                                        | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 2       | 0.50\nCMPQ $-0x3,(%RDI,%RAX,8)                                   | 1     | 0.25 | 0.25 | 0.50 | 0.50 | 0  | 0.25 | 0.25 | 0  | 1       | 0.50\nJE 2ac83 <hypre_BoomerAMGBuildMultipass._omp_fn.10+0x593>  | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\nCMPQ $0x1,0x10(%RSP)                                       | 1     | 0.25 | 0.25 | 0.50 | 0.50 | 0  | 0.25 | 0.25 | 0  | 1       | 0.50\nJE 2af40 <hypre_BoomerAMGBuildMultipass._omp_fn.10+0x850>  | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\nMOV 0x28(%RSP),%RAX                                        | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 2       | 0.50\nMOV (%RAX,%R12,1),%RDI                                     | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 2       | 0.50\nCMP %RDI,(%RAX,%R11,1)                                     | 1     | 0.25 | 0.25 | 0.50 | 0.50 | 0  | 0.25 | 0.25 | 0  | 1       | 0.50\nJE 2af40 <hypre_BoomerAMGBuildMultipass._omp_fn.10+0x850>  | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\nADD $0x8,%RCX                                              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nADD $0x8,%RDX                                              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nCMP %RCX,0x8(%RSP)                                         | 1     | 0.25 | 0.25 | 0.50 | 0.50 | 0  | 0.25 | 0.25 | 0  | 1       | 0.50\nJE 2ad58 <hypre_BoomerAMGBuildMultipass._omp_fn.10+0x668>  | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\nMOV (%RCX),%RAX                                            | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 2       | 0.50\nCMP (%R14,%RAX,8),%RSI                                     | 1     | 0.25 | 0.25 | 0.50 | 0.50 | 0  | 0.25 | 0.25 | 0  | 1       | 0.50\nLEA (,%RAX,8),%R12                                         | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0  | 1       | 0.50\nJNE 2ac58 <hypre_BoomerAMGBuildMultipass._omp_fn.10+0x568> | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\nMOV 0x58(%RSP),%RDI                                        | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 2       | 0.50\nMOV (%RDI,%RAX,8),%RAX                                     | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 2       | 0.50\nMOV 0x8(%RDI,%R12,1),%R13                                  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 2       | 0.50\nCMP %R13,%RAX                                              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nJGE 2acf4 <hypre_BoomerAMGBuildMultipass._omp_fn.10+0x604> | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\nNOPW (%RAX,%RAX,1)                                         | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0       | 0.25\nMOV 0x50(%RSP),%RDI                                        | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 2       | 0.50\nMOV (%RDI,%R12,1),%RAX                                     | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 2       | 0.50\nMOV 0x8(%RDI,%R12,1),%R12                                  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 2       | 0.50\nCMP %R12,%RAX                                              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nJGE 2ac83 <hypre_BoomerAMGBuildMultipass._omp_fn.10+0x593> | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\nNOPL (%RAX,%RAX,1)                                         | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0       | 0.25\nADD $0x8,%RCX                                              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nADD $0x8,%RDX                                              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nCMP %RCX,0x8(%RSP)                                         | 1     | 0.25 | 0.25 | 0.50 | 0.50 | 0  | 0.25 | 0.25 | 0  | 1       | 0.50\nJNE 2ac96 <hypre_BoomerAMGBuildMultipass._omp_fn.10+0x5a6> | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\nADDSD (%RDX),%XMM1                                         | 1     | 0    | 1    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 1\nJMP 2ac83 <hypre_BoomerAMGBuildMultipass._omp_fn.10+0x593> | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 1    | 0  | 0       | 1-2\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 35\nnb uops            : 35\nloop length        : 160\nused x86 registers : 10\nused mmx registers : 0\nused xmm registers : 1\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 6\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nFIT IN UOP CACHE\nmicro-operation queue: 8.75 cycles\nfront end            : 8.75 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7\n--------------------------------------------------------------\nuops   | 5.75 | 5.75 | 8.50 | 8.50 | 0.00 | 5.75 | 5.75 | 0.00\ncycles | 5.75 | 5.75 | 8.50 | 8.50 | 0.00 | 5.75 | 5.75 | 0.00\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 8.75\nDispatch  : 8.50\nOverall L1: 8.75\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 0%\nload   : 0%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 0%\nFP\nall    : 0%\nload   : 0%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 0%\nother  : NA (no other vectorizable/vectorized instructions)\nINT+FP\nall    : 0%\nload   : 0%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 0%\nother  : 0%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 25%\nload   : 25%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 25%\nFP\nall    : 25%\nload   : 25%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 25%\nother  : NA (no other vectorizable/vectorized instructions)\nINT+FP\nall    : 25%\nload   : 25%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 25%\nother  : 25%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 8.75 cycles. At this rate:\n - 24% of peak load performance is reached (15.54 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n",
        },
      },
      header = {
        "0% of peak computational performance is used (0.11 out of 16.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 8.75 to 4.00 cycles (2.19x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is not vectorized.\n4 data elements could be processed at once in vector registers.\nBy vectorizing your loop, you can lower the cost of an iteration from 8.75 to 2.19 cycles (4.00x speedup).",
        },
        {
          title = "Execution units bottlenecks",
          txt = "Found no such bottlenecks but see expert reports for more complex bottlenecks.",
        },
      },
      potential = {
      },
    },
  },
  AVG = {
      hint = {
        {
          title = "Type of elements and instruction set",
          txt = "1 SSE or AVX instructions are processing arithmetic or math operations on double precision FP elements in scalar mode (one at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 1 FP arithmetical operations:\n - 1: addition or subtraction\nThe binary loop is loading 136 bytes (17 double precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.01 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 2ac96\n\nInstruction                                                | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7 | Latency | Recip. throughput\n----------------------------------------------------------------------------------------------------------------------------------------------------\nMOV 0x20(%RSP),%RDI                                        | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 2       | 0.50\nCMPQ $-0x3,(%RDI,%RAX,8)                                   | 1     | 0.25 | 0.25 | 0.50 | 0.50 | 0  | 0.25 | 0.25 | 0  | 1       | 0.50\nJE 2ac83 <hypre_BoomerAMGBuildMultipass._omp_fn.10+0x593>  | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\nCMPQ $0x1,0x10(%RSP)                                       | 1     | 0.25 | 0.25 | 0.50 | 0.50 | 0  | 0.25 | 0.25 | 0  | 1       | 0.50\nJE 2af40 <hypre_BoomerAMGBuildMultipass._omp_fn.10+0x850>  | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\nMOV 0x28(%RSP),%RAX                                        | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 2       | 0.50\nMOV (%RAX,%R12,1),%RDI                                     | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 2       | 0.50\nCMP %RDI,(%RAX,%R11,1)                                     | 1     | 0.25 | 0.25 | 0.50 | 0.50 | 0  | 0.25 | 0.25 | 0  | 1       | 0.50\nJE 2af40 <hypre_BoomerAMGBuildMultipass._omp_fn.10+0x850>  | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\nADD $0x8,%RCX                                              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nADD $0x8,%RDX                                              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nCMP %RCX,0x8(%RSP)                                         | 1     | 0.25 | 0.25 | 0.50 | 0.50 | 0  | 0.25 | 0.25 | 0  | 1       | 0.50\nJE 2ad58 <hypre_BoomerAMGBuildMultipass._omp_fn.10+0x668>  | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\nMOV (%RCX),%RAX                                            | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 2       | 0.50\nCMP (%R14,%RAX,8),%RSI                                     | 1     | 0.25 | 0.25 | 0.50 | 0.50 | 0  | 0.25 | 0.25 | 0  | 1       | 0.50\nLEA (,%RAX,8),%R12                                         | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0  | 1       | 0.50\nJNE 2ac58 <hypre_BoomerAMGBuildMultipass._omp_fn.10+0x568> | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\nMOV 0x58(%RSP),%RDI                                        | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 2       | 0.50\nMOV (%RDI,%RAX,8),%RAX                                     | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 2       | 0.50\nMOV 0x8(%RDI,%R12,1),%R13                                  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 2       | 0.50\nCMP %R13,%RAX                                              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nJGE 2acf4 <hypre_BoomerAMGBuildMultipass._omp_fn.10+0x604> | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\nNOPW (%RAX,%RAX,1)                                         | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0       | 0.25\nMOV 0x50(%RSP),%RDI                                        | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 2       | 0.50\nMOV (%RDI,%R12,1),%RAX                                     | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 2       | 0.50\nMOV 0x8(%RDI,%R12,1),%R12                                  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 2       | 0.50\nCMP %R12,%RAX                                              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nJGE 2ac83 <hypre_BoomerAMGBuildMultipass._omp_fn.10+0x593> | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\nNOPL (%RAX,%RAX,1)                                         | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0       | 0.25\nADD $0x8,%RCX                                              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nADD $0x8,%RDX                                              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nCMP %RCX,0x8(%RSP)                                         | 1     | 0.25 | 0.25 | 0.50 | 0.50 | 0  | 0.25 | 0.25 | 0  | 1       | 0.50\nJNE 2ac96 <hypre_BoomerAMGBuildMultipass._omp_fn.10+0x5a6> | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\nADDSD (%RDX),%XMM1                                         | 1     | 0    | 1    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 1\nJMP 2ac83 <hypre_BoomerAMGBuildMultipass._omp_fn.10+0x593> | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 1    | 0  | 0       | 1-2\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 35\nnb uops            : 35\nloop length        : 160\nused x86 registers : 10\nused mmx registers : 0\nused xmm registers : 1\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 6\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nFIT IN UOP CACHE\nmicro-operation queue: 8.75 cycles\nfront end            : 8.75 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7\n--------------------------------------------------------------\nuops   | 5.75 | 5.75 | 8.50 | 8.50 | 0.00 | 5.75 | 5.75 | 0.00\ncycles | 5.75 | 5.75 | 8.50 | 8.50 | 0.00 | 5.75 | 5.75 | 0.00\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 8.75\nDispatch  : 8.50\nOverall L1: 8.75\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 0%\nload   : 0%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 0%\nFP\nall    : 0%\nload   : 0%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 0%\nother  : NA (no other vectorizable/vectorized instructions)\nINT+FP\nall    : 0%\nload   : 0%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 0%\nother  : 0%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 25%\nload   : 25%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 25%\nFP\nall    : 25%\nload   : 25%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 25%\nother  : NA (no other vectorizable/vectorized instructions)\nINT+FP\nall    : 25%\nload   : 25%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 25%\nother  : 25%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 8.75 cycles. At this rate:\n - 24% of peak load performance is reached (15.54 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n",
        },
      },
      header = {
        "0% of peak computational performance is used (0.11 out of 16.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 8.75 to 4.00 cycles (2.19x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is not vectorized.\n4 data elements could be processed at once in vector registers.\nBy vectorizing your loop, you can lower the cost of an iteration from 8.75 to 2.19 cycles (4.00x speedup).",
        },
        {
          title = "Execution units bottlenecks",
          txt = "Found no such bottlenecks but see expert reports for more complex bottlenecks.",
        },
      },
      potential = {
      },
    },
  common = {
    header = {
      "",
      "Warnings:\n - Non-innermost loop: analyzing only self part (ignoring child loops).\n - Ignoring paths for analysis\n - Too many paths. Rerun with max-paths=8\n - RecMII not computed since number of paths is unknown or > max_paths\n - Streams not analyzed since number of paths is unknown or > max_paths\n",
      "Try to simplify control and/or increase the maximum number of paths per function/loop through the 'max-paths-nb' option.\n",
    },
    nb_paths = 1,
  },
}
