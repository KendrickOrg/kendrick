as yet unclassified
evaluateWithModel: model
	"This function will be modified by adding other evaluation in future when other types of interaction appearing"
	^ ((self expression evaluateWithModel: model) + 
		(self evaluateCouplingInteraction: model) + 
		(self evaluateMovementEvents: model))