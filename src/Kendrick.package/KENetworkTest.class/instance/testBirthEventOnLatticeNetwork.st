tests
testBirthEventOnLatticeNetwork
	|model ind|
	model := KEModel new.
	model population compartments: #((S 90) (I 1) (R 0)) defNetwork: #lattice numberOfContacts: 4.
	self assert: (model population graph nodes size) equals: 91.
	ind := KEIndividual new currentStatus: #I.
	model population graph newNode: (ind).
	self assert: (model population graph nodes size) equals: 92.
	self assert: (model population graph nodes last at: #S) equals: 1.
	self assert: (model population graph nodes last at: #I) equals: 1.
	self assert: (model population graph nodes at: 92) adjacentNodes asArray equals: #(82 91).
	self assert: ind position equals: #(2 10).
	