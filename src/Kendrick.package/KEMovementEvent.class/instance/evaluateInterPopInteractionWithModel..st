as yet unclassified
evaluateInterPopInteractionWithModel: model	
	|r|
	interRate number = 0 ifTrue: [ ^ 0 ].
	r := interRate number * ((model population at: fromStatus) at: compartment) currentNbIndividuals.
	^ r