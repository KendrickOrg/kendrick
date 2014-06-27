as yet unclassified
simulatorBuilder
	simulatorBuilder ifNil: [ 
		simulatorBuilder := KESimulatorBuilder passSimulatorClass: (model simulator simulatorClass).
		simulatorBuilder model: model
		 ].
	^ simulatorBuilder
	
	