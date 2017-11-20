Contributing
============

Here are guidelines used for contributions to the repo, including Issues, Commit, Pull Requests and so on.

Issues
------

You should at least give us what happened (by some screen copy-paste) and how to reproduce. Please, always
make your title **AND** your description descriptive. Never use titles like *need a package*. The title
should generally start with `PKGNAME VERSION[, PKG2 VER2..]: blah`.

We are not your writing teachers, but please, try to write in complete sentences. We also accept Chinese as
long as you're not using broken Chinese.

If you are pasting console interaction and output, wrap it in a code-pre block with two <code>```</code>'s,
like this:

```
(gdb) print spend_loveca(11)
233
(gdb)
```

Hey, I need a new Package!
--------------------------

We can actually crunch through package requests in quite some speed, we call them `pakreq`, and naming your requests
properly can help us identify them more easily. We recommend that you open a `pakreq` in a format below.

```
pakreq: [package-name]
```

Attached with a link to the project upstream or another distribution's package page. And we will do our best to get
them shipped on request.

Usually most `pakreq` will be fulfilled, with a few exceptions:

- The package cannot be stored in our repository or one of our mirrors (e.g. licensing issue);
- The package has no tag and is still in initial development effort;
- The package cannot be built no matter what we try (quite rare);

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
