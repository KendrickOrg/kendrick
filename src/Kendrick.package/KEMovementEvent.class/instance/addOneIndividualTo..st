as yet unclassified
addOneIndividualTo: aStatus
	((aStatus = fromStatus) | (aStatus = toStatus)) ifTrue: [ actions at: aStatus put: 1 ]