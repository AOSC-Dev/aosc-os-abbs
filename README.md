AOSC OS ABBS Tree
=================

Here is some copypasta from the [wiki](https://github.com/AOSC-Dev/aosc-os-abbs/wiki/).
It is also available as a submodule called `.githubwiki`.

This is the repository that stores all of AOSC OS build configurations, using [ABBS](https://github.com/AOSC-Dev/abbs) (AutoBuild Build Service). This repository contains configurations of AOSC OS ports to a variety of architectures (x86_64, armel alike).

## Rationale, and the existing issue

For more than three years (from late 2011 to currently season 2 of 2015), AOSC OS has been built with Autobuild - however - without any recording and enforcement of build process. The worst of all, although patches and source modifications are recorded, no source link was provided. And consequently raises skepticism from our users and inside of the development team.

### To amend the issue

With this repository, all packages in AOSC OS will be recorded in the new "abbs tree" model that includes source code specs (that includes download link for the source code, and the versions), and unified configurations for various architectural ports.

## To build a package from this repository

First of all, clone this repository as ${ABBS}/repo , please refer to [ABBS](https://github.com/AOSC-Dev/abbs) for details about repository support of ABBS.

To build a package, for example, coreutils:

`abbs-build base-utils/coreutils`

And just watch the magnificent work that your computer is doing.

## Tips to new comers

* You should always keep this repository updated as it includes security updates;
* There is a "testing" branch apart from "master" that includes newest feature/non-security updates, developers should NOT use "testing" unless their new package(s) needs packages from this branch;
* Non-CT (Core Team) members should use PRs (Pull Requests) to merge new updates;

## ARM special case

Our ARM ports (v7 or v8 in the future) will have a special ABBS tree, [aosc-os-arm-bsps](https://github.com/AOSC-Dev/aosc-os-arm-bsps) containing ARM device specific Xorg drivers, Kernels, Firmwares, Bootloaders, etc. They will not be merged into this tree.
