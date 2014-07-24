tests
testBirthEventOnLatticeNetwork
	|model|
	model := KEModel new.
	model population compartments: #((S 90) (I 1) (R 0)) defNetwork: #lattice numberOfContacts: 4 surface: 1.
	self assert: (model population graph nodes size) equals: 91.
	model population graph newNode: (KEIndividual new currentStatus: #I).
	self assert: (model population graph nodes size) equals: 92.
	self assert: (model population graph nodes last at: #S) equals: 1.
	self assert: (model population graph nodes last at: #I) equals: 1.
	