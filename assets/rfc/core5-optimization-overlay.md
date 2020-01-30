(Original Title: Increased Coverage of Instruction Optimization)

How this RFC works
------------------

- As this RFC is sent to the discussions list, please provide all your feedback here if possible. Although a copy of this post will be provided on Github, and discussed on Telegram/IRC (I will be reposting discussions found in these chat groups over here on their behalf).
- This post is compatible with Github Markdown, use a previewer if necessary.

Rationale
---------

AOSC OS, as it stands, has been able to utilize instruction optimization on each of the supported platform relatively well – while preserving compatibility across devices of that specific architecture.¹ However, some optimizations were excluded for the purpose of retaining compatibility, arguably "wasting" some potential performance output on certain devices. A good example would be our AMD64 port – principle, and longest running port – where for the concern of compatibility our instruction optimization has only been enabled to the level of SSE3, whereas SSSE3 and SSE4 were introduced with Core 2 Duo, just one generation ahead in the Intel EMT64 timeline, later followed by AVX and AVX2 with Sandy Bridge and Haswell, respectively.

Performance improvement, according to a 2013 survey on "optimized binaries" showed significant performance increase in some applications, while showing little to none, even negative performance impact in some other cases.² At this stage of discussion, it is believed that similar performance outcome could be observed with other ports of AOSC OS, with the exception of the ARM ports, where NEON has already been imposed on both ports, breaking some device compatibility.

Proposed Changes
----------------

Given the discussion, above, it is suggested that AOSC OS introduce a new repository-based framework for distribution of "further optimized" binaries for any given architecture, which, for the purpose of this RFC, shall be referred to as "optimization overlays".

In principle, an optimization overlay provides what is visible to users and the package manager as "system/package updates" when enabled. For example, given our current repository layout, the AMD64 DPKG repository is located in:

    ${mirrorname}/os-amd64/os3-dpkg

Written in APT configuration as:

    deb ${mirrorname}/os-amd64/os3-dpkg /

When integrated with the intended changes, say, an AVX2 overlay is to be put in place, it will be located at:

    ${mirrorname}/os-amd64/avx2/os3-dpkg /

And thus, the APT configuration will contain an extra line:

    deb ${mirrorname}/os-amd64/os3-dpkg /
    deb ${mirrorname}/os-amd64/avx2/os3-dpkg /

This configuration should be able to be enabled with enhancements to the apt-gen-list utility (currently worked on by Junde Yhi <lmy441900@aosc.io>), which is already included with every installation of AOSC OS, where a command line switch could toggle an overlay – or for the sake of simplicity, detecting processor capabilities automatically from the /proc/cpuinfo file, and automatically enable any available overlay(s).

As currently planned, the optimization overlay should be made available to multiple ports of AOSC OS, applied to packages in Core, and to other instruction set aware packages in the ABBS/ACBS tree. But do note that the overlay is not necessarily limited to the practice of providing packages with extra instruction optimization flags enabled, but to also provide packages with platform/device specific changes (patches or forks) – this will be especially visible with both MIPS ports, where Loongson-specific changes may be introduced for improved performance – and thus included in the MIPS' optimization overlays.

To clarify the proposal, a table is produced to show current plan on optimization overlays for each AOSC OS port:

| Ports                     | Overlay? | Overlay Contents (if any)         | Extra Optimization Flags (if any) |
|---------------------------|----------|-----------------------------------|-----------------------------------|
| AMD64 (amd64)             | Yes      | AVX2 optimized binaries           | -march=haswell -mtune=haswell     |
| ARMv7 (armel)             | No       | -                                 | -                                 |
| ARMv8 (aarch64)           | No       | -                                 | -                                 |
| MIPS32 (mipsel)           | Yes      | Loongson 2E+ binaries and patches | -march=loongson2 -mtune=loongson2 |
| MIPS64 (mips64el)         | Yes      | Loongson 3+ binarie and patches   | -march=loongson3 -mtune=loongson3 |
| PowerPC 32-bit (powerpc)  | Yes      | AltiVec optimized binaries        | -maltivec -mabi=altivec           |
| PowerPC 64-bit BE (ppc64) | No       | -                                 | -                                 |

Extra Changes Required
----------------------

- Autobuild3 will need to support "secondary architectures/hosts", for example, an $ABHOST of amd64-avx2, which provides extra compiler flags with $AB/arch/amd64-avx2.sh, while still producing packages of its root architecture/host, i.e., amd64.
- As mentioned above, new repositories providing these overlay packages.
- Extra tests to be conducted by packagers, for any packages with optimization overlay, it should be tested on both regular and overlay'd system roots.
- A new form of ticket/issue type sent in by users and developers for optimization requests - optreq.

Questions
---------

- How should overlay'd packages be labeled as updates? Higher epoch?
- How should packages with platform-specific changes be managed by ABBS/ACBS? Independent tree? Branch?

Notes
-----

- ¹ However, it should be pointed out that this description comes with exceptions for ARMv7 (armel) where NEON is required, on MIPS32/64 (mipsel, mips64el) where MIPS-II (thus excluding MIPS-I) and MIPS64r2 (thus excluding MIPS64r1) ABIs are required, and on PowerPC 64-bit Big Endian (ppc64) where AltiVec is required (thus excluding some Freescale-based PowerPC 64-bit processors, which are used on some AmigaONE desktop computers, e.g. the A5000).
- ² Larabel, Michael. "Optimized Binaries Provide Great Benefits For Intel Haswell,” Phoronix, 15 June, 2013. http://www.phoronix.com/scan.php?page=article&item=intel_core_avx2
