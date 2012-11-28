as yet unclassified
getResultAt: aCompartment
	^ timeSeries at: aCompartment ifAbsent: [ ^ nil ]