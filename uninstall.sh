#!/bin/bash

if [ -d "torch" ] ; then
    read -p "Are you sure you want to uninstall Torch?" -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        rm -rf "torch"
    else
        echo "Uninstall aborted!"
    fi
else
    echo "Torch not found!"
fi
