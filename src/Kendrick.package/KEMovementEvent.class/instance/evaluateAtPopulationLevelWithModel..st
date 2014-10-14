as yet unclassified
evaluateAtPopulationLevelWithModel: model	
	|r|
	rate number = 0 ifTrue: [ ^ 0 ].
	r := rate number * ((fromStatus) at: compartment) currentNbIndividuals.
	^ r