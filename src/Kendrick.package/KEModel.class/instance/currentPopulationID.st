accessing
currentPopulationID
	^ temporalParameters at: #PID ifAbsent: [ ^ nil ]