as yet unclassified
simulatorBuilder
	simulatorBuilder ifNil: [ 
		|simulatorClass|
		model simulator 
		ifNil: [ simulatorClass := KEDeterministicSimulator ]
		ifNotNil: [ simulatorClass := model simulator simulatorClass ]. 
		simulatorBuilder := KESimulatorBuilder passSimulatorClass: simulatorClass.
		simulatorBuilder model: model
		 ].
	^ simulatorBuilder
	
	