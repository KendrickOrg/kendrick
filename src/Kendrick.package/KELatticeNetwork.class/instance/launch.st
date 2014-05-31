as yet unclassified
launch
	|distances y id p|
	distances := self calDistances.
	y := distances copy sort: [ :a :b| a < b ].
	id := self indexOf: y in: distances.
	p := 1 to: ((contact * nbInd / 2) - (2 * (nbInd sqrt))).
	p do: [ :i|
		self with: (edges at: (id at: i)) weight: #contact value: 1
		 ].
	self initializeContacts.
	^ self