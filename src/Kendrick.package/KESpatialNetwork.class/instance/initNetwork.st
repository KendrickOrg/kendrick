as yet unclassified
initNetwork
	|distances probs y id p|
	"if the connection kernel function is not yet defined"
	kernel ifNil: [ kernel := [ :d| (d*5) negated exp ] ].
	"calculate the distance between any two individuals"
	self initLocation.
	distances := self calDistances.
	probs := self calProb: distances.
	y := probs copy sort: [ :a :b| a < b ].
	id := self indexOf: y in: probs.
	"get contact*nbInd/2 last edges with probs sorted in y"
	p := (y size) + ((1-(numberOfContacts * (self nodes size) / 2)) to: 0).
	p do: [ :i|
		self with: (edges at: (id at: i)) weight: #contact value: 1
		 ].
	self initContacts.
	^ self
	
	