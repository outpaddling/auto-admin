# Pkgsrc Quick Start

[Pkgsrc](https:pkgsrc.org) is a powerful and portable package manager for
Unix-like systems.

A package manager is a system for quickly and cleanly installing,
deinstalling, and upgrading software packages.

While most package managers only work on one specific platform, and some
others that advertise as "cross-platform" really only work on 2 or 3
platforms, pkgsrc is designed to work on *any* POSIX-compliant system.  It
is well-supported on NetBSD, many Linux distributions, macOS, and Solaris-based
systems, but also has been used on other BSD systems and Cygwin.  In the
pkgsrc community, users of many different Unix-like systems all benefit
directlyt from each others' work.

According to [Repology](https:repology.org), pkgsrc also has one of the
larger package collections among all package managers, and it is continually
growing.

The basic installation of pkgsrc, called "bootstrapping", is a somewhat
involved, multi-step process.  To simplify the process for new users, I
created [auto-pkgsrc-setup](https://github.com/outpaddling/auto-admin/blob/master/Scripts/auto-pkgsrc-setup),
a script that ensures your system is ready for a pkgsrc installation and
then guides you through the bootstrap process.

All you need to do is download the script, run it, and follow the on-screen
instructions.

The entire process takes less than 10 minutes with default options on a
typical machine.  Expect half an hour or more if you answer YES to all the
bells and whistles (install the work-in-progress (WIP) package collection and
Mozilla certs, etc.)  Downloading the extensive WIP collection is often the
longest part of the process.

Unlike some community repositories, pkgsrc packages are rigorously
quality-controlled.  Packages can only be added to the official collection by
"committers", people who have proven their ability through contributions to
pkgsrc over a long period of time before being invited to join the team,
and then undergo a mentoring period to ensure the quality of their work
before they earn their wings.

However, there is also a [work-in-progress, or "WIP" collection](http://pkgsrc.org/wip/),
where community members can contribute, collaborate, and hone their skills.
