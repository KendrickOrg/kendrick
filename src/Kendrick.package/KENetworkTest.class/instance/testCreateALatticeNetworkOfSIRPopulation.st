tests
testCreateALatticeNetworkOfSIRPopulation
	|model|
	model := KEModel new.
	model population compartments: #((S 1000) (I 0) (R 0)) defNetwork: #lattice numberOfContacts: 4.
	self assert: (model population graph nodes size) equals: 1000.