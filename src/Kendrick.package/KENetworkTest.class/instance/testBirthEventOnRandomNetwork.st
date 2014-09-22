tests
testBirthEventOnRandomNetwork
	|model population|
	model := KEModel new.
	population := KEMetaPopulation new.
	population compartments: #(S I R).
	population at: #S put: 90; at: #I put: 1; at: #R put: 0.
	KENetwork new: #random numberOfContacts: 4 onPopulation: population.
	model population: population.
	
	self assert: (model population graph nodes size) equals: 91.
	model population graph newNode: (KEIndividual new currentStatus: #I).
	self assert: (model population graph nodes size) equals: 92.
	
	