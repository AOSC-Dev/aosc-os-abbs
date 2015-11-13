Contributing
============

Here are guidelines used for contributions to the repo, including Issues, Commit, Pull Requests and so on.

Issues
------

You should at least give us what happened (by some screen copy-paste) and how to reproduce. Please, always
make your title **AND** your description descriptive. Never use titles like *need a package*. The title
should generally start with `PKGNAME VERSION[, PKG2 VER2..]: blah`.

We are not your writing teachers, but please, try to write in complete sentences. We also accept Chinese as
long as it's not broken Chinese.

Code Changes
------------

Read the workflow stuffs from the `.githubwiki` submodule or read it on GitHub.

Abstract:

Build all packages with:

* AOSC BuildKit, AOSC OS, but no other modified, or derivatives;
* an unmodified version of abbs (autobuild3 will be installed automatically) from the AOSC community repository;
* Better if a minimal environment like BuildKit, but not your local copy of AOSC OS;

Generally, aosc-os-abbs separates packages into "base" and "extra" sections:

* Base should only include libraries, or executables that is needed by any of autobuild3, abbs, dpkg, or rpm;
* Extra has everything else that exists :D;

Structurally, any new directory added should be discussed with the developers as they are **not decided yet**.
