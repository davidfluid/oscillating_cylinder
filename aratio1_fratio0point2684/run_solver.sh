#!/bin/bash

#foamCleanTutorials
#rm -rf 0 > /dev/null 2>&1
#cp -r 0_org 0  > /dev/null 2>&1
blockMesh | tee log.blockMesh
checkMesh | tee log.checkMesh
renumberMesh -overwrite -noFunctionObjects | tee log.renumbermesh
pimpleFoam | tee log.pimpleFoam
