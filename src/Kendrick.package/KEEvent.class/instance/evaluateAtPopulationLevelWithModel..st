accessing
evaluateAtPopulationLevelWithModel: model	
	|r|
	r := (rate evaluateWithModel: model) abs.
	self fromStatus ~= #empty 
	ifTrue: [ 
		r := r * (((model currentSubPopulation) at: (self fromStatus)) currentNbIndividuals).
		]
	ifFalse: [  
		r := r * ((model currentSubPopulation) nbOfIndividuals)
		].
	^ r