as yet unclassified
testCreateANetworkOfSIRPopulation
	|model|
	model := KEModel new.
	model population compartments: #((S 99) (I 1) (R 0)).
	self assert: (model population graph nodes size) equals: 0.
	self assert: (model population graph indList size) equals: 100.