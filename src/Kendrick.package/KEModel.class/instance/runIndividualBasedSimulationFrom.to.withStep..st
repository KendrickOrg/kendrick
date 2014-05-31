as yet unclassified
runIndividualBasedSimulationFrom: tMin to: tMax withStep: dT
	simulator := (KEIndividualBasedSimulator2 new) tMin: tMin; tMax: tMax; step: dT; model: self; algorithm: #default.
	data := simulator execute.
	^ data.
	

	
		