
!KEModel methodsFor: 'as yet unclassified'!
sumOfRate
	| rateTotal |
	rateTotal := 0.
	eventList do:[:each | rateTotal := rateTotal + (each evaluateWithModel: self).
		].
	^rateTotal! !
