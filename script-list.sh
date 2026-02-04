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
# Auto-admin script list

Each script below is documented by a man page.  To view the documentation,
install auto-admin using your chosen package manager and run \`man script\`
(e.g. \`man auto-update-system\`).

| Script | Purpose |
|----------|---------|
EOM

# Man page
cat << EOM > Man/auto-admin.8
.TH AUTO-ADMIN 8

.SH NAME
auto-admin - Portable, command-line systems management scripts

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

auto-admin provides the main menu for common auto-admin tasks such as
updating the system, managing users, services, etc.

EOM

# auto-man2man is available in wip/auto-dev (FreeBSD ports and pkgsrc)
auto-man2man Man/* >> Man/auto-admin.8

cat << EOM >> Man/auto-admin.8
.ad
.fi

.SH "SEE ALSO"
stdio(3)

.SH AUTHOR
.nf
.na
J Bacon
EOM

# Debug
# man Man/auto-admin.8

# For github
for file in Man/*; do
    if [ $file != Man/auto-admin.8 ]; then
	name_line=$(auto-man2man $file)
	echo $name_line
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
