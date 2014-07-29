accessing
graph
	self isPopulation 
	ifTrue: [ 
		graph := KENetwork new.
		 ]
	ifFalse: [ 
		graph := KEGraph new.
		subPopulationNames ifNil: [ graph nodes: (subPopulations size) ] ifNotNil: [ graph nodes: subPopulationNames ]
		 ].
	^ graph