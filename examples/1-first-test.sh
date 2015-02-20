#!/bin/sh
#dotfw - dash shell open testing framework - http://safrm.net/projects/dotfw
#author: Miroslav Safr <miroslav.safr@gmail.com>
# helloworld example with process realated functions

APP=/usr/bin/xeyes
DOTFW_PROCESS=1
[ -z "$TCID" ] && . /usr/bin/dotfw

teststart "lets try something easy- help"
$APP --help
RET=$?
if [ $RET -ne 1 ]; then
    testfail "help returns some other code than 130 ($RET)"
fi
testend

teststart "now something on background"
$APP &
sleep 10
appProcessCount
RET=$?
if [ $RET -ne 1 ]; then
    testfail "something is not runnig ($RET)"
fi
testend

summary







