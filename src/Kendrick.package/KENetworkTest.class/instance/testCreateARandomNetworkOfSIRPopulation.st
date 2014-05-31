as yet unclassified
testCreateARandomNetworkOfSIRPopulation
	|model|
	model := KEModel2 new.
	model population compartments: #((S 99999) (I 1) (R 0)) defNetwork: 'random' contact: 4 surface: 1.
	self assert: (model population graph nodes size) equals: 100000.