as yet unclassified
sumOfRate
	| rateTotal |
	rateTotal := 0.
	events do: [ :each | rateTotal := rateTotal + (each evaluateWithModel: self) abs ].
	^ rateTotal