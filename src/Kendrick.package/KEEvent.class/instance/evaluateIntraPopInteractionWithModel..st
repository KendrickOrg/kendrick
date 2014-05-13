accessing
evaluateIntraPopInteractionWithModel: model	
	"In this function, calculate rate of model and return as intra-pop interaction rate"
	^ (rate evaluateWithModel: model) abs
	
