#!/bin/sh
#dotfw - dash shell open testing framework - http://safrm.net/projects/dotfw
#author: Miroslav Safr <miroslav.safr@gmail.com>
#example to test ports

APP=/usr/sbin/sshd
DOTFW_NETWORK=1
[ -z "$TCID" ] && . /usr/bin/dotfw

if isPortOpen localhost 22 ; then
    echo "22 open"
else
    echo "22 closed"
fi

if isPortOpen localhost 8085 ; then
    echo "8085 open"
else
    echo "8085 closed"
fi
