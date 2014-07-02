as yet unclassified
evaluateWithModel: model
	"This function will be modified by adding other evaluation in future when other types of interaction appearing"
	"^ ((self expression evaluateWithModel: model) + 
		(self evaluateCouplingExpressions: model) + 
		(self evaluateMovementExpressions: model)
	   )"
	|result|
	result := self expression evaluateWithModel: model.
	self rtExprImpls do: [ :each|
		result := result + (each evaluateWithModel: model)
		 ].
	^ result