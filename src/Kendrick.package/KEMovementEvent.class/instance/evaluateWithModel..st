as yet unclassified
evaluateWithModel: model	
	"^ (self evaluateInterPopInteractionWithModel: model)"
	|r|
	rate number = 0 ifTrue: [ ^ 0 ].
	r := rate number * ((model population at: fromStatus) at: compartment) currentNbIndividuals.
	^ r