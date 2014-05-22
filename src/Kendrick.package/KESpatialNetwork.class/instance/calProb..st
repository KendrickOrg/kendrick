as yet unclassified
calProb: distances
	|probs|
	probs := OrderedCollection new.
	distances do: [ :each|
		probs add: (kernel value: each)
		 ].
	probs := probs - (Random new) next: (probs size).
	^ probs
	
	