tests
testCreateASmallWorldNetworkOfSIRPopulation
	|model|
	model := KEModel new.
	model population compartments: #((S 99) (I 1) (R 0)) defNetwork: 'smallworld' contact: 4 surface: 1.
	self assert: (model population graph nodes size) equals: 100.