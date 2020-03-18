_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          title = "Type of elements and instruction set",
          txt = "No instructions are processing arithmetic or math operations on FP elements. This loop is probably writing/copying data or processing integer elements.",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop does not contain any FP arithmetical operations.\nThe binary loop is loading 32 bytes.\nThe binary loop is storing 8 bytes.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 2ab90\n\nInstruction                                                | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7   | Latency | Recip. throughput\n------------------------------------------------------------------------------------------------------------------------------------------------------\nMOV (%R13,%RAX,8),%RDX                                     | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nCMP %R14,(%R12,%RDX,8)                                     | 1     | 0.25 | 0.25 | 0.50 | 0.50 | 0  | 0.25 | 0.25 | 0    | 1       | 0.50\nJNE 2aba4 <hypre_BoomerAMGBuildMultipass._omp_fn.10+0x4b4> | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\nMOV 0x40(%RSP),%RCX                                        | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nMOV %RSI,(%RCX,%RDX,8)                                     | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nADD $0x1,%RAX                                              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nCMP %RAX,(%RDI)                                            | 1     | 0.25 | 0.25 | 0.50 | 0.50 | 0  | 0.25 | 0.25 | 0    | 1       | 0.50\nJG 2ab90 <hypre_BoomerAMGBuildMultipass._omp_fn.10+0x4a0>  | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 8\nnb uops            : 7\nloop length        : 29\nused x86 registers : 9\nused mmx registers : 0\nused xmm registers : 0\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 1\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 1.75 cycles\nfront end            : 1.75 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7\n--------------------------------------------------------------\nuops   | 1.00 | 1.00 | 2.00 | 2.00 | 1.00 | 1.00 | 1.00 | 1.00\ncycles | 1.00 | 1.00 | 2.00 | 2.00 | 1.00 | 1.00 | 1.00 | 1.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 1.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 1.75\nDispatch  : 2.00\nData deps.: 1.00\nOverall L1: 2.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all    : 0%\nload   : 0%\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 0%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all    : 25%\nload   : 25%\nstore  : 25%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 25%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 2.00 cycles. At this rate:\n - 25% of peak load performance is reached (16.00 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 12% of peak store performance is reached (4.00 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
      },
      header = {
        "0% of peak computational performance is used (0.00 out of 4.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is not vectorized.\n4 data elements could be processed at once in vector registers.\nBy vectorizing your loop, you can lower the cost of an iteration from 2.00 to 0.50 cycles (4.00x speedup).",
        },
        {
          workaround = " - Read less array elements\n - Write less array elements\n - Provide more information to your compiler:\n  * hardcode the bounds of the corresponding 'for' loop\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by:\n - reading data from caches/RAM (load units are a bottleneck)\n - writing data to caches/RAM (the store unit is a bottleneck)\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 2.00 to 1.75 cycles (1.14x speedup).\n",
        },
      },
      potential = {
      },
    },
    {
      hint = {
        {
          title = "Type of elements and instruction set",
          txt = "No instructions are processing arithmetic or math operations on FP elements. This loop is probably writing/copying data or processing integer elements.",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop does not contain any FP arithmetical operations.\nThe binary loop is loading 24 bytes.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 2ab90\n\nInstruction                                                | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7 | Latency | Recip. throughput\n----------------------------------------------------------------------------------------------------------------------------------------------------\nMOV (%R13,%RAX,8),%RDX                                     | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 2       | 0.50\nCMP %R14,(%R12,%RDX,8)                                     | 1     | 0.25 | 0.25 | 0.50 | 0.50 | 0  | 0.25 | 0.25 | 0  | 1       | 0.50\nJNE 2aba4 <hypre_BoomerAMGBuildMultipass._omp_fn.10+0x4b4> | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\nADD $0x1,%RAX                                              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nCMP %RAX,(%RDI)                                            | 1     | 0.25 | 0.25 | 0.50 | 0.50 | 0  | 0.25 | 0.25 | 0  | 1       | 0.50\nJG 2ab90 <hypre_BoomerAMGBuildMultipass._omp_fn.10+0x4a0>  | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 6\nnb uops            : 5\nloop length        : 20\nused x86 registers : 6\nused mmx registers : 0\nused xmm registers : 0\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 1.25 cycles\nfront end            : 1.25 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7\n--------------------------------------------------------------\nuops   | 1.00 | 1.00 | 1.50 | 1.50 | 0.00 | 1.00 | 1.00 | 0.00\ncycles | 1.00 | 1.00 | 1.50 | 1.50 | 0.00 | 1.00 | 1.00 | 0.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 1.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 1.25\nDispatch  : 1.50\nData deps.: 1.00\nOverall L1: 1.50\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all    : 0%\nload   : 0%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 0%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all    : 25%\nload   : 25%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 25%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 1.50 cycles. At this rate:\n - 25% of peak load performance is reached (16.00 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
      },
      header = {
        "0% of peak computational performance is used (0.00 out of 4.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is not vectorized.\n4 data elements could be processed at once in vector registers.\nBy vectorizing your loop, you can lower the cost of an iteration from 1.50 to 0.38 cycles (4.00x speedup).",
        },
        {
          workaround = " - Read less array elements\n - Provide more information to your compiler:\n  * hardcode the bounds of the corresponding 'for' loop\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by reading data from caches/RAM (load units are a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 1.50 to 1.25 cycles (1.20x speedup).\n",
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
          txt = "No instructions are processing arithmetic or math operations on FP elements. This loop is probably writing/copying data or processing integer elements.",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop does not contain any FP arithmetical operations.\nThe binary loop is loading 28 bytes.\nThe binary loop is storing 4 bytes.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 7\nnb uops            : 6\nloop length        : 24.50\nused x86 registers : 7.50\nused mmx registers : 0\nused xmm registers : 0\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0.50\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nfront end: 1.50 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7\n--------------------------------------------------------------\nuops   | 1.00 | 1.00 | 1.75 | 1.75 | 0.50 | 1.00 | 1.00 | 0.50\ncycles | 1.00 | 1.00 | 1.75 | 1.75 | 0.50 | 1.00 | 1.00 | 0.50\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 1.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 1.50\nDispatch  : 1.75\nData deps.: 1.00\nOverall L1: 1.75\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all    : 0%\nload   : 0%\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 0%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all    : 25%\nload   : 25%\nstore  : 25%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 25%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 1.75 cycles. At this rate:\n - 25% of peak load performance is reached (16.00 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 6% of peak store performance is reached (2.00 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
      },
      header = {
        "0% of peak computational performance is used (0.00 out of 4.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is not vectorized.\n4 data elements could be processed at once in vector registers.\nBy vectorizing your loop, you can lower the cost of an iteration from 1.75 to 0.44 cycles (4.00x speedup).",
        },
      },
      potential = {
      },
    },
  common = {
    header = {
      "",
      "The structure of this loop is probably <if then [else] end>.\n",
      "The presence of multiple execution paths is typically the main/first bottleneck.\nTry to simplify control inside loop: ideally, try to remove all conditional expressions, for example by (if applicable):\n - hoisting them (moving them outside the loop)\n - turning them into conditional moves, MIN or MAX\n\n",
    },
    nb_paths = 2,
  },
}
