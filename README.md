AOSC OS ABBS Tree
=================

The AOSC OS ABBS Tree contains build configurations and scripts
for all packages made available in the official AOSC OS
[repository](https://repo.aosc.io), organised in a tree-like fashion. The "Tree"
is split into three main classes and various sub-categories:

- `core-*` contains components of the [AOSC OS Core](README.CORE.md).
- `app-*` contains applications.
- `desktop-*` contains desktop environments and their supporting libraries.
- `lang-*` contains programming language support stacks.
- `meta-*` contains meta packages (`*-base`).
- `runtime-*` contains runtime libraries and data.

Branches
--------

The ABBS Tree is maintained in a multi-branch fashion, for more information,
please refer to the [AOSC OS Maintenance Guidelines](https://wiki.aosc.io/developer/packaging/topic-based-maintenance-guideline).

Groups
------

When using [ACBS](https://github.com/AOSC-Dev/acbs) (Autobuild CI Build System),
it is possible to build a series of packages with a single command. This is
achieved by the "groups" defined in the `groups/` directory, with files defining
a list of packages to build.

Notes for developers on Windows
-------------------------------

Currently, this repository cannot be checked out on Windows, since there are
backslashes (`\`) in file names, specifically required by [systemd.mount](https://www.freedesktop.org/software/systemd/man/latest/systemd.mount.html#Description)
for [string escaping](https://www.freedesktop.org/software/systemd/man/latest/systemd.unit.html#String%20Escaping%20for%20Inclusion%20in%20Unit%20Names),
which is [not a valid Windows file name](https://learn.microsoft.com/windows/win32/fileio/naming-a-file#naming-conventions).
Notebly, repository checkout will also fail in MinGW or Cygwin environments
for the same reason. We recommend using Windows Subsystem for Linux (WSL) to
work on this repository. In case you missed it, AOSC OS on WSL is available
[on Microsoft Store](https://www.microsoft.com/store/apps/9NMDF21NV65Z)!

Further Readings
----------------

- [Intro to Package Maintenance](https://wiki.aosc.io/developer/packaging/basics)
- [AOSC OS Package Styling Manual](https://wiki.aosc.io/developer/packaging/package-styling-manual)

Useful Links
------------

- [AOSC OS Packages](https://packages.aosc.io/)
- [AOSC OS Packages, QA Information](https://packages.aosc.io/qa/)
    - [List of Package Issue Codes](https://wiki.aosc.io/developer/packaging/qa-issue-codes)
- [AOSC Buildbot Information](https://wiki.aosc.io/developer/infrastructure/buildbots)

Need Help?
----------

Please report any build-time and run-time issues using our
[issues](https://github.com/AOSC-Dev/aosc-os-abbs/issues) page.
