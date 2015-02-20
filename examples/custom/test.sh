#!/bin/sh
#dotfw - dash shell open testing framework - http://safrm.net/projects/dotfw
#author: Miroslav Safr <miroslav.safr@gmail.com>
#simple example to use custom environment

[ -z "$TCID" ] && . ./common

teststart  "my custom"
testfail "it fails"
testend

doCleanUp
summary






