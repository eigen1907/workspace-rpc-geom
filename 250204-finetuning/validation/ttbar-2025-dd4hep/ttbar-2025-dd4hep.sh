cmsDriver.py TTbar_14TeV_TuneCP5_cfi  -s GEN,SIM -n 100 --conditions auto:phase1_2025_realistic --beamspot DBrealistic --datatier GEN-SIM --eventcontent FEVTDEBUG --geometry DD4hepExtended2025 --era Run3_2025 --relval 9000,100 --fileout file:step1.root  > step1_TTbar_14TeV+2025.log  2>&1
cmsDriver.py step2  -s DIGI:pdigi_valid,L1,DIGI2RAW,HLT:@relval2025 --conditions auto:phase1_2025_realistic --datatier GEN-SIM-DIGI-RAW -n 10 --eventcontent FEVTDEBUGHLT --geometry DD4hepExtended2025 --era Run3_2025 --filein  file:step1.root  --fileout file:step2.root  > step2_TTbar_14TeV+2025.log  2>&1
cmsDriver.py step3  -s RAW2DIGI,L1Reco,RECO,RECOSIM,PAT,NANO,VALIDATION:@standardValidation+@miniAODValidation,DQM:@standardDQM+@ExtraHLT+@miniAODDQM+@nanoAODDQM --conditions auto:phase1_2025_realistic --datatier GEN-SIM-RECO,MINIAODSIM,NANOAODSIM,DQMIO -n 10 --eventcontent RECOSIM,MINIAODSIM,NANOEDMAODSIM,DQM --geometry DD4hepExtended2025 --era Run3_2025 --filein  file:step2.root  --fileout file:step3.root  > step3_TTbar_14TeV+2025.log  2>&1
cmsDriver.py step4  -s HARVESTING:@standardValidation+@standardDQM+@ExtraHLT+@miniAODValidation+@miniAODDQM+@nanoAODDQM --conditions auto:phase1_2025_realistic --mc  --geometry DD4hepExtended2025 --scenario pp --filetype DQM --era Run3_2025 -n 100  --filein file:step3_inDQM.root --fileout file:step4.root  > step4_TTbar_14TeV+2025.log  2>&1
