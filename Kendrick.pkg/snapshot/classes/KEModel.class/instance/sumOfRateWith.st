
!KEModel methodsFor: 'as yet unclassified'!
sumOfRateWith
	| rateTotal |
	rateTotal := 0.
	eventList do: [ :each | rateTotal := rateTotal + (each evaluateWithModel: self).
		].
	^rateTotal! !
