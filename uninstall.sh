#!/bin/bash

if [ -d "torch" ] ; then
    read -p "Are you sure you want to uninstall Torch?" yn
    case $yn in
        [Yy]* ) rm -rf "torch"; break;;
        * ) echo "Uninstall aborted!";;
    esac
else
    echo "Torch not found!"
fi
