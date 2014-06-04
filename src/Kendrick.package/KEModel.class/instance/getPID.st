accessing
getPID
	^ temporalParameters at: #PID ifAbsent: [ ^ nil ]