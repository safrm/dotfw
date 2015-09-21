#/bin/sh
#dotfw - dash shell open testing framework
#web: http://safrm.net/projects/dotfw
#author: Miroslav Safr <miroslav.safr@gmail.com>
. appver-installer

appver_basic_scripts_test

$MKDIR_755 $BINDIR
$INSTALL_755 ./dotfw $BINDIR
appver_update_version_and_date $BINDIR/dotfw
$INSTALL_755 ./dotfw-network $BINDIR
$INSTALL_755 ./dotfw-process $BINDIR

