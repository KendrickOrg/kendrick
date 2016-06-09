as yet unclassified
removeTransitionFrom: aCompartment to: anotherCompartment
	|from to|
	from := Dictionary newFrom: aCompartment.
	to := Dictionary newFrom: anotherCompartment.
	self addTransitionFrom: aCompartment to: anotherCompartment probability: 0