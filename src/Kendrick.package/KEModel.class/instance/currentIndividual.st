accessing
currentIndividual
	^ temporalParameters at: #ind ifAbsent: [ ^ nil ]