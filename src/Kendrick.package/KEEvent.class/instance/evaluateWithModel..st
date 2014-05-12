accessing
evaluateWithModel: model	
	"This function return the rate of event, take into account the intra-pop and inter-pop interaction rate"
	^ (self evaluateIntraPopInteractionWithModel: model) + (self evaluateInterPopInteractionWithModel: model)