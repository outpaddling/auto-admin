#!/bin/sh -e

##########################################################################
#   Description:
#       
##########################################################################

usage()
{
    printf "Usage: $0 [--check]\n"
    exit 64     # sysexits(3) EX_USAGE
}


##########################################################################
#   Main
##########################################################################

check=no
if [ $# == 1 ] && [ $1 == --check ]; then
    check=yes
elif [ $# != 0 ]; then
    usage
fi

cat << EOM > scripts.md
# auto-admin script list

Each script below is documented by a man page.  To view the documentation,
install auto-admin using your chosen package manager and run \`man script\`
(e.g. \`man auto-update-system\`).

| Script | Purpose |
|--------|---------|
EOM

# Man page
cat << EOM > Man/auto-admin.8
.TH auto-admin 8

.SH NAME
.PP
auto-admin - Portable scripts for Unix systems management

\" Convention:
\" Underline anything that is typed verbatim - commands, etc.
.SH SYNOPSIS
.PP
.nf 
.na
auto-admin
.ad
.fi

.SH ARGUMENTS
.nf
.na
None
.ad
.fi

.SH DESCRIPTION

While POSIX and other Unix standards provide fairly uniform
APIs and user interfaces, systems management tools tend to
be very system-specific.  E.g., to manage user accounts, many
Unix systems use "useradd", a few BSDs use "pw", and macOS
uses "dsctl".  BSD systems report RAM size via "sysctl", while
Linux systems rely on /proc/meminfo.

.B Auto-admin
is a project providing easy-to-use, portable scripts for common
systems management tasks from the command line.  It simplifies
what are often complex commands, and makes them uniform across
Unix-like systems.

The project also provides a menu, invoked as "auto-admin", for
the most common tasks, along with submenus for networking, user management,
etc.

.B Auto-admin
thus allows sysadmins to easily manage multiple different
POSIX systems with vastly less esoteric knowledge and effort.
The scripts can serve as a compatibility layer for higher-level
tools such as SPVM (Simple, Portable Cluster Manager).

.SH RETURN VALUES

0 upon successful exit, non-zero if certain commands failed

.SH SEE ALSO

auto-update-system(1), auto-user-admin(1),

.SH SCRIPTS
.nf
.na
EOM

# auto-man2man is available in wip/auto-dev (FreeBSD ports and pkgsrc)
auto-man2man Man/auto-* >> Man/auto-admin.8

cat << EOM >> Man/auto-admin.8
.ad
.fi

.SH "SEE ALSO"
stdio(3)
EOM

# Debug
man Man/auto-admin.8

# For github
for file in Man/*; do
    if [ $file != Man/auto-admin.8 ] && ! echo $file | grep -q "_[gs]et_"; then
	name_line=$(auto-man2man $file)
	if [ -n "$name_line" ]; then
	    printf "| ${name_line% - *} | ${name_line#* - } |\n" >> scripts.md
	fi
    fi
done

# Debug
if [ $check = yes ]; then
    more scripts.md
    grip --export scripts.md
    firefox ./scripts.html
fi
