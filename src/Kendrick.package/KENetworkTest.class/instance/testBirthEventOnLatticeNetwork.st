tests
testBirthEventOnLatticeNetwork
	|model population ind|
	model := KEModel new.
	population := KEMetaPopulation new.
	population compartments: #(S I R).
	population at: #S put: 90; at: #I put: 1; at: #R put: 0.
	KENetwork new: #lattice numberOfContacts: 4 onPopulation: population.
	model population: population.
	self assert: (model population graph nodes size) equals: 91.
	ind := KEIndividual new currentStatus: #I.
	model population graph newNode: (ind).
	self assert: (model population graph nodes size) equals: 92.
	self assert: (model population graph nodes last at: #S) equals: 1.
	self assert: (model population graph nodes last at: #I) equals: 1.
	self assert: (model population graph nodes at: 92) adjacentNodes asArray equals: #(82 91).
	self assert: ind position equals: #(2 10).
	