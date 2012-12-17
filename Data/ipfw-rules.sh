#!/bin/sh

cmd="ipfw -q add"
pif=%%PUBLIC%%
lif=%%LOCAL%%

ipfw -q -f flush

#############################################################################
# Exempt local traffic from NAT

$cmd 00010 allow all from any to any via lo0
# $cmd 00020 allow all from any to any via $lif
$cmd 00040 allow all from 192.168.0.0/24 to me via $lif
$cmd 00045 allow all from me to 192.168.0.0/24 via $lif

#############################################################################
# Bad: This would prevent return packets from being diverted through NAT
# to local machines.  Many of them in reality don't need to be altered,
# but we need NATD to determine that.
# $cmd 00046 allow all from not me to me via $pif

#############################################################################
# Exempt traffic originating on gateway from NAT
$cmd 00047 allow all from me to not me via $pif

#############################################################################
# Divert outgoing packets from local machines and all incoming packets
# from the public interface through NAT

# $cmd 00050 divert 8668 ip4 from any to any via $pif
$cmd 00050 divert 8668 all from 192.168.0.0/24 to any via $pif
$cmd 00060 divert 8668 all from any to me via $pif

$cmd 00200 deny ip from any to 127.0.0.0/8
$cmd 00300 deny ip from 127.0.0.0/8 to any
$cmd 00400 deny ip from any to ::1
$cmd 00500 deny ip from ::1 to any
$cmd 00600 allow ipv6-icmp from :: to ff02::/16
$cmd 00700 allow ipv6-icmp from fe80::/10 to fe80::/10
$cmd 00800 allow ipv6-icmp from fe80::/10 to ff02::/16
$cmd 00900 allow ipv6-icmp from any to any ip6 icmp6types 1
$cmd 01000 allow ipv6-icmp from any to any ip6 icmp6types 2,135,136
$cmd 65000 allow ip from any to any

