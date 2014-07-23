as yet unclassified
launch
	|distances y id p|
	self initLocation.
	distances := self calDistances.
	y := distances copy sort: [ :a :b| a < b ].
	id := self indexOf: y in: distances.
	p := 1 to: ((numberOfContacts * (self nodes size) / 2) - (2 * ((self nodes size) sqrt))).
	p do: [ :i|
		self with: (edges at: (id at: i)) weight: #contact value: 1
		 ].
	self initContacts.
	^ self