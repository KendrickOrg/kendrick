accessing
evaluateIntraPopInteractionWithModel: model	
	"In this function, calculate rate of model and return as intra-pop interaction rate"
	(values at: 1) < 0 ifTrue: [ values at: 1 put: (rate evaluateWithModel: model) abs ].
	^ (values at: 1)
