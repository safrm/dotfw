# dotfw - dash open testing framework
## 
Light weight collection of testing functions to run various tests for rapid projects.

#installation
    sudo make install

#usage  
##examples/1-first-test.sh
    #choose app to test 
    APP=/usr/bin/xeyes

    #souce fw
    [ -z "$TCID" ] && . /usr/bin/dotfw

    #start first test
    teststart "lets try something easy- help"
    #tested command
    $APP --help
    RET=$?
    #decission
    if [ $RET -ne 1 ]; then
        #test fails
        testfail "help returns some other code than 130 ($RET)"
    fi
    #test is ok
    testend

    #second test with automatically increased test id
    teststart "now something on background"
    #running on background
    $APP &
    sleep 2
    #testing action
    appProcessCount
    RET=$?
    #decission
    if [ $RET -ne 1 ]; then
        #test fails
        testfail "$APPNAME is not runnig, maybe it is not installed ($RET)"
    fi
    #test is ok
    testend

    #get summary of executions + spent time and list of failiours
    summary


##examples/2-using-valgrind.sh




