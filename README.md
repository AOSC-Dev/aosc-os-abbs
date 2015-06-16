*This repo is currently work in progress*

# AOSC OS "abbs" Tree

This is the repository that stores all of AOSC OS build configurations, using ![ABBS](https://github.com/AOSC-Dev/abbs) (AutoBuild Build Service). This repository contains configurations of AOSC OS ports to a variety of architectures (x86_64, armel alike).

## Rationale, and the existing issue

For more than three years (from late 2011 to currently season 2 of 2015), AOSC OS has been built with Autobuild - however - without any recording and enforcement of build process. The worst of all, although patches and source modifications are recorded, no source link was provided. This, ironically, raises skepticism from inside of the development team.

### To amend the issue

With this repository, all packages in AOSC OS will be recorded in the new "abbs tree" model that includes source code specs (that includes download link for the source code, and the versions), and unified configurations for various architectural ports.

## In practice

As mentioned above, all AOSC OS packages will be recorded in "abbs tree" model.

### Regulations, and guidelines

#### What you must do

* Build all packages with AOSC BuildKit, AOSC OS, but no other modified, or derivatives;
* Build all packages with an unmodified version of abbs (autobuild3 will be installed automatically) from the AOSC community repository;

#### You are endorsed to

* Build all packages with a minimal environment like BuildKit, but not your local copy of AOSC OS;

## Directory designing

Generally, aosc-os-abbs separates packages into "base" and "extra" sections:

* Base should only include libraries, or executables that is needed by any of autobuild3, abbs, dpkg, or rpm;
* Extra has everything else that exists :D;

Structurally, any new directory added should be discussed with the developers as they are **not decided yet**.

## To build a package from this repository

First of all, clone this repository as ${ABBS}/repo , please refer to ![ABBS](https://github.com/AOSC-Dev/abbs) for details about repository support of ABBS.

To build a package, for example, coreutils:

abbs-build base-utils/coreutils

And just watch the magnificent work that your computer is doing.

## Tips to new comers

* You should always keep this repository updated as it includes security updates;
* There is a "testing" branch apart from "master" that includes newest feature/non-security updates, developers should NOT use "testing" unless their new package(s) needs packages from this branch;
* Non-CT (Core Team) members should use PRs (Pull Requests) to merge new updates;
