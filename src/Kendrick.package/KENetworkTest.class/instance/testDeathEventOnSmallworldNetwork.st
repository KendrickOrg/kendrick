as yet unclassified
testDeathEventOnSmallworldNetwork
	|model stt|
	model := KEModel2 new.
	model population compartments: #((S 90) (I 1) (R 0)) defNetwork: 'smallworld' contact: 4 surface: 1.
	self assert: (model population graph nodes size) equals: 91.
	stt := model population graph releaseRoom: 80.
	(model population at: stt) removeIndividual: 1.
	self assert: (model population graph nodes size) equals: 91.
	self assert: (model population graph emptyRooms size) equals: 1.