tests
testDeathEventOnRandomNetwork
	|model stt|
	model := KEModel new.
	model population compartments: #((S 90) (I 1) (R 0)) defNetwork: #random numberOfContacts: 4.
	self assert: (model population graph nodes size) equals: 91.
	stt := model population graph releaseNode: (model population indList at: 80).
	(model population at: stt) removeIndividual: 1.
	self assert: (model population graph nodes size) equals: 91.
	self assert: (model population graph emptyNodes size) equals: 1.