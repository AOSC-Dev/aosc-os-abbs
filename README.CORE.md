AOSC OS Core
============

AOSC OS Core was introduced after the final debut of AOSC OS3 (the last version
of AOSC OS with a versioned name), designed to standardise...

- Core runtime libraries.
- Basic toolchains.

For AOSC OS and its potential derivatives.

The Core also serves as a versioning agent for AOSC OS (provided by
`aosc-aaa` - the "bed-rock level" definition of AOSC OS).

Rationale
---------

AOSC OS is a decently large distribution project providing more than 5,000
packages in its [repository](https://repo.aosc.io/), and port are available
for multiple architectures:

- x86...
    - AMD64: with SSE3 support (x86_64-aosc-linux-gnu).
    - i486: Intel 80486 compatible or newer (i486-aosc-linux-gnu).
- ARM...
    - AArch64 (aarch64-aosc-linux-gnu)
    - ARMv7: with NEON support (armv7a-aosc-linux-gnueabihf)
- PowerPC (Big Endian)...
    - PowerPC 32-bit: Apple G3/G4, IBM 7xx/74xx (powerpc-aosc-linux-gnu).
    - PowerPC 64-bit: Apple G5, IBM PowerPC 970 (powerpc64-aosc-linux-gnu).
- POWER (Little Endian)...
    - IBM POWER8 compatible or newer (ppc64el-aosc-linux-gnu).
- RISC-V...
    - RISC-V: RV64GC compatible variants (riscv64-aosc-linux-gnu).

Maintaining such large amount of packages across multiple architectures is
not an easy job for AOSC OS maintainers: in case of security vulnerbilities,
major updates, and mass rebuilds, AOSC OS developers may find their time
limited to finish the respective tasks in a timely fashion.

Therefore, AOSC OS Core will serve a standard for **ALL** AOSC OS ports 
with a version definition of its counterpart - released on a non-regulated
schedule, thus saving time and potential frustration for the maintainers.

In practice
-----------

The following practices is defined for AOSC OS Core development:

* AOSC OS Core will take in place of the "AOSC OSn" (where "n" is a natural
  number) versioning rules, however it will be versioned in the "x.y.z"
  format.
* `aosc-aaa` will be included as the only base-line definition for AOSC OS
  Core, with filesystem structure and basic configurations that may affect
  system behaviours.
* AOSC OS Core will *not* be updated as soon as new components were
  released, any major version bump should be first discussed (fork it if you
  do need to update, and PR if you feel like doing so).
* Only toolchain level packages like will be included (by definition).
* *All* security updates will be provided when applicable.
* AOSC OS Core development and maintenance follows the
  [AOSC OS Maintenance Guidelines](https://wiki.aosc.io/developers/aosc-os-maintenance-guidelines).

### An example of update cycle

AOSC OS3, after being released as the last versioned release, it will release
versions as follows...

* Stable series (Stable-Proposed, Stable): 3.1, 3.2, 3.3, ..., 3.10, 3.11, ...
* Experimental (Experimental, Testing-Proposed, Testing) series: 3.99.1, 3.99.2, ..., 3.99.10, 3.99.11, ...

![update_model](/assets/images/AOSC%20OS%20Core%20Rationale%2C%20update%20model.png)

Stable and Experimental series will not affect each other, nor do they have
a "testing - release" relationship. 3.99 series (Experimental) will become
the future 4.0 series... And the cycle continues.

Packages
--------

AOSC OS Core currently include the following packages:

* linux+api, "Linux API Headers for glibc"
* zlib, "A Massively Spiffy Yet Delicately Unobtrusive Compression Library"
* glibc, "GNU C Library"
* tzdata, "Time Zone Data"
* gmp, "GNU Multiprecision library"
* mpfr, "Functions for multiple precision math"
* mpc, "A library for the arithmetic of complex numbers"
* isl, "Library for manipulating sets and relations of integer points bounded by linear constraints"
* gcc-runtime, "GNU Compiler Collection (runtime libraries only)"
* gcc, "GNU Compiler Collection", (languages: c, c++, fortran, lto)
* binutils, "a set of programs to assemble and manipulate binary and object files"
* gdbm, "GNU Database Manager library"
* db, "Berkeley DB embedded database system"
* perl, "a highly capable and feature rich programming language"
* readline, "GNU realine library"
* ncurses, "System V Release 4.0 curses emulation library"
* bash, "Bourne Again SHell"
* make, "GNU Make, designed for code processing"
* aosc-aaa, "bed rock level system definitions"

(total of 19 packages)

Building the Core
-----------------

Please first refer to our
[AOSC Cadet Training](https://github.com/AOSC-Dev/aosc-os-abbs/wiki)
handbook.

Derivatives of AOSC OS Core
---------------------------

Derivatives may be built upon AOSC OS Core, as the packages provided in
AOSC OS Core may form a functioning chroot environment for distribution
developers.

However, BuildKit can still be used as a minimal initial environment, as
BuildKit itself was built upon AOSC OS Core.

You may obtain a copy of BuildKit [here](https://aosc.io/os-download).

Need help?
----------

Please report any build-time and run-time issues using our
[issues](https://github.com/AOSC-Dev/aosc-os-abbs/issues/new/choose) page.
