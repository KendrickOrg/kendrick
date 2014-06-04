as yet unclassified
testBirthEventOnSmallWorldNetwork
	|model|
	model := KEModel new.
	model population compartments: #((S 90) (I 1) (R 0)) defNetwork: 'smallworld' contact: 4 surface: 1.
	self assert: (model population graph nodes size) equals: 91.
	model population graph newInd: (KEIndividual new currentStatus: #I) in: #(0).
	self assert: (model population graph nodes size) equals: 92.
	
	