Auto-admin
==========
Auto-admin is a set of tools for automating common systems management tasks
such as enabling/disabling services, tuning the system, installing software,
managing users, etc.

## The project has two primary goals

* Provide a compatibility layer to help automate sysadmin tasks across
multiple platforms.
* Act as a knowledge base for performing sysadmin tasks from the
command-line. 

## Core design principals

* Complete portability: Our aim is to support any POSIX platform for which
someone is willing to maintain the code.
* Zero dependencies: All scripts are written in POSIX Bourne shell and use
only tools included with a minimal install, so auto-admin can be the first
package installed after the OS.
* Speed and Simplicity: Our efforts are focused on basic functionality,
robustness, fast and easy setup and management.

## Installing

The preferred installation method is using a package manager such as
FreeBSD ports or [pkgsrc](https://pkgsrc.org), a high-quality
cross-platform package manager with an extensive package collection that
works on virtually any POSIX platform.  Packages may exist in other package
managers as well, but we maintain a FreeBSD port and a pkgsrc package and
update them regularly with new releases.  New pkgsrc users may want to
try out [auto-pkgsrc-setup](https://github.com/outpaddling/auto-admin/blob/master/User-scripts/auto-pkgsrc-setup), a simple script
to guide you through a pkgsrc installation.  Auto-pkgsrc-setup is actually
part of auto-admin, but designed to run independently to solve the chicken-egg
problem of getting pkgsrc running before auto-admin is installed.

It is also possible, but not recommended, to perform a "caveman install"
by downloading the source from Github and running "make install".

Auto-admin includes well over 100 scripts for performing systems management
tasks as well as a simple menu system for the most common ones, such as
installing software, adding users, etc.

To get started, simple open a terminal and run auto-admin.

[More information](https://acadix.biz/auto-admin.php)
