as yet unclassified
removeTransitionFrom: aCompartment to: anotherCompartment
	|from to|
	from := Dictionary newFrom: aCompartment.
	to := Dictionary newFrom: anotherCompartment.
	transitions do: [ :each| 
		((each from = from) & (each to = to)) ifTrue: [ ^ each probability: 0 ]
		].
	^ self error: 'Transition to be removed does not exist'