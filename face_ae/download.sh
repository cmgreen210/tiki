#!/bin/bash

if [ -d "data" ] ; then
    rm -rf "data"
fi

mkdir data
(cd data && wget http://tamaraberg.com/faceDataset/faceData.tar.gz && tar -xf faceData.tar.gz && rm faceData.tar.gz)

luarocks install unsup
luarocks install matio
