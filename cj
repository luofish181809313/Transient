#! /bin/sh

# ------------------------------------------
# This is shell to start virtualbox linux and login in with ssh
# If no password required, you should add authorized key in your 
# remote and local ssh folder
# -----------------------------------------
#run vbox cmd to judge if ubuntu is running
running_vm=`VBoxManage list runningvms`
#virtual machine should be same with the one set up in program
virtual_machine="Ubuntu"

if [[ $running_vm =~ $virtual_machine ]]
then
    echo "$running_vm is running!"
else
    VBoxManage startvm $virtual_machine --type headless
fi

ssh jack@127.0.0.1 -p 2222 
