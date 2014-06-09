as yet unclassified
testUpdateStatusOnMovementEvent
	|model|
	model := KEModel new.
	model population nodes: 5 forEach: [ :node|
		node compartments: #((S 1000) (I 0))
		 ].
	((model population at: #(0 1)) graph indList at: 80) moveTo: (model population at: #(0 2)).
	((model population at: #(0 1)) at: #S) removeIndividual: 1.
	self assert: ((model population at: #(0 2)) at: #S) currentNbIndividuals equals: 1001.
	self assert: ((model population at: #(0 1)) at: #S) currentNbIndividuals equals: 999.

	