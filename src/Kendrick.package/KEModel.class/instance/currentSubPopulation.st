accessing
currentSubPopulation
	^ temporalParameters at: #currentSubPopulation ifAbsent: [ ^ nil ]