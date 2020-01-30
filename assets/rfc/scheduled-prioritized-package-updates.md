(Original Title: Scheduled/Prioritized Package Updates)

How this RFC works
------------------

- As this RFC is sent to the discussions list, please provide all your feedback here if possible. Although a copy of this post will be provided on Github, and discussed on Telegram/IRC (I will be reposting discussions found in these chat groups over here on their behalf).
- This post is compatible with Github Markdown, use a previewer if necessary.

Rationale
---------

Currently AOSC OS is updated in an arbitrary fashion, where a batch of packages could be held on with a rough "cycle" (that was me, I'm sorry), where security updates were also mixed within the batch, resulting in delayed update for critical security issues. Furthermore, packages were first built _exclusively_ on AMD64 - with our recently introduced "noarch"/data packages, users of non-AMD64 architectures on which package updates could very well be delayed for up to 2 weeks, could be constantly running into dependency issues, further degrading security and functionality of these ports of AOSC OS.

The intent of this RFC is to provide a scheduled/prioritized model for AOSC OS package updates, where non-security package updates/fixes/enhancements or pakreq results were pushed to the community repository in a monthly cycle, while security updates were built across all architectures - _independent_ from non-security update cycles, and pushed _immediately_ after building and testing.

This change is not intended for AOSC OS Core.

Proposed Changes
----------------

For non-security package updates (this includes pakreq'd packages and bugfixes), on the calendar of any given month...

| Day/Week Count | Tasks |
|-----------------------|-----------------------------------------------------------------|
| 1st day | Pending package updates were gathered from information sources. |
| 1st - 2nd week | Package updates built on all architectures, sync or async. |
| Fridays of 2nd week | Untested package updates pushed to a staging repository. |
| 3rd - 4th week | Package updates tested across all architectures. |
| Last Friday | Tested packages available to non-staging AOSC OS users. |
| Rest of the month | Fun time, whatever. |

For security updates, fixes and security package updates will be built immediately by the first "responder" (couldn't find the proper word, this is apparently only found in Spanish), and... As a security was built and tested, it would be pushed to the community repository _without_ going through the staging repository and _regardless_ of synchronization between different architectures - however, packagers should be notified and expected to build and test these updates at their earliest availability.

Extra Changes Required
----------------------

- A new branch `bugfix` will be opened in the ABBS tree, this also applies to overlays.
- Changes made in the `staging` and its resulting packages will be uploaded to the staging repository.
- _After_ changes are merged to the `master` branch, packages will be made available in the community repository.

Questions
---------

- Should users be able to access the staging repository despite the potential danger of breaking a working system?
- Should packages be de-duped of older revisions before they were made available to the community repository?
- Only applies to those available in the staging repository (ask for clarification if confused).
- What if an architecture did not make it in time, should non-security updates be delayed to be uploaded with the next cycle? Or simply delay?
