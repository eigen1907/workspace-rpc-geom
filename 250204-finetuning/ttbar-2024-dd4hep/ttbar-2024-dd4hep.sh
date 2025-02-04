cmsDriver.py TTbar_14TeV_TuneCP5_cfi  -s GEN,SIM -n 100 --conditions auto:phase1_2024_realistic --beamspot DBrealistic --datatier GEN-SIM --eventcontent FEVTDEBUG --geometry DD4hepExtended2024 --era Run3_2024 --relval 9000,100 --fileout file:step1.root --nThreads 10  > step1_TTbar_14TeV+2024.log  2>&1
cmsDriver.py step2  -s DIGI:pdigi_valid,L1,DIGI2RAW,HLT:@relval2024 --conditions auto:phase1_2024_realistic --datatier GEN-SIM-DIGI-RAW -n 100 --eventcontent FEVTDEBUGHLT --geometry DD4hepExtended2024 --era Run3_2024 --filein  file:step1.root  --fileout file:step2.root --nThreads 10  > step2_TTbar_14TeV+2024.log  2>&1
cmsDriver.py step3  -s RAW2DIGI,L1Reco,RECO,RECOSIM,PAT,NANO,VALIDATION:@standardValidationNoHLT+@miniAODValidation,DQM:@standardDQMFakeHLT+@miniAODDQM+@nanoAODDQM --conditions auto:phase1_2024_realistic --datatier GEN-SIM-RECO,MINIAODSIM,NANOAODSIM,DQMIO -n 100 --eventcontent RECOSIM,MINIAODSIM,NANOEDMAODSIM,DQM --geometry DD4hepExtended2024 --era Run3_2024 --filein  file:step2.root  --fileout file:step3.root --nThreads 10  > step3_TTbar_14TeV+2024.log  2>&1
cmsDriver.py step4  -s HARVESTING:@standardValidationNoHLT+@standardDQMFakeHLT+@miniAODValidation+@miniAODDQM+@nanoAODDQM --conditions auto:phase1_2024_realistic --mc  --geometry DD4hepExtended2024 --scenario pp --filetype DQM --era Run3_2024 -n 100  --filein file:step3_inDQM.root --fileout file:step4.root --nThreads 10  > step4_TTbar_14TeV+2024.log  2>&1
