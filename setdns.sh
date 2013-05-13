#!/bin/bash

# Add the localhost dnsmasq server to the head of the nameserver list, if it
# is running
# http://wizardmode.com/2012/06/apache-php-mysql-dev-on-os-x-lion-with-a-minimum-of-pain/

# short-circuits
if [ ! -f /etc/resolv.conf ]; then exit; fi

DNSMASQ_RUNNING=`ps auxw | grep [d]nsmasq`
if [ -z "$DNSMASQ_RUNNING" ]; then
    exit
fi

NAMESERVERS=$(cat /etc/resolv.conf  | grep ^nameserver | cut -d' ' -f2- | xargs echo -n)

if echo $NAMESERVERS | /usr/bin/egrep -q '127\.0\.0\.1' ; then
    exit
fi

logger -s setdns: adding 127.0.0.1 before existing list of nameservers $NAMESERVERS

# Find the device ID for the priamry internet interface
PSID=$( (scutil | grep PrimaryService | sed -e 's/.*PrimaryService : //')<< EOF
open
get State:/Network/Global/IPv4
d.show
quit
EOF
)

scutil << EOF
open
d.init
d.add ServerAddresses * 127.0.0.1 $NAMESERVERS
set State:/Network/Service/$PSID/DNS
quit
EOF
