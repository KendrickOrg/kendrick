accessing
evaluateAtPopulationLevelWithModel: model	
	|r|
	r := (rate evaluateWithModel: model) abs.
	self fromStatus ~= #empty 
	ifTrue: [ 
		r := r * (((model population at: (model currentPopulationID)) at: (self fromStatus)) currentNbIndividuals).
		]
	ifFalse: [  
		r := r * ((model population at: (model currentPopulationID)) getNbIndividuals)
		].
	^ r