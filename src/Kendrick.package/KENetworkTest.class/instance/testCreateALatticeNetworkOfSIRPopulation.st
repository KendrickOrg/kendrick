as yet unclassified
testCreateALatticeNetworkOfSIRPopulation
	|model|
	model := KEModel new.
	model population compartments: #((S 1000) (I 0) (R 0)) defNetwork: 'lattice' contact: 4 surface: 1.
	self assert: (model population graph nodes size) equals: 1000.