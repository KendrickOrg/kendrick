as yet unclassified
removeOneIndividualFrom: aStatus
	((aStatus = fromStatus) | (aStatus = toStatus)) ifTrue: [ actions at: aStatus put: -1 ]