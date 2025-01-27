#!/bin/bash

JOBID=$1 # $(Process)
CMSSW_PATH=$2 # /eos/user/j/joshin/workspace-eos/rpc-geom/CMSSW_15_0_X_2025-01-21-2300
CONFIG_PATH=$3 # /eos/user/j/joshin/workspace-eos/rpc-geom/workspace-rpc-geom/250123-validation/ttbar-2017/TTbar_13TeV_TuneCUETP8M1_cfi_GEN_SIM.py
OUTDIR=$4 # root://eosuser.cern.ch/geom-val/ttbar-2017/step1

source /cvmfs/cms.cern.ch/cmsset_default.sh

cd $CMSSW_BASE
eval `scram runtime -sh`

cmsRun $CONFIG_PATH \
  outputFile=/tmp/output_${JOBID}.root

xrdcp /tmp/output_${JOBID}.root ${OUTDIR}/output_${JOBID}.root
rm /tmp/output_${JOBID}.root
