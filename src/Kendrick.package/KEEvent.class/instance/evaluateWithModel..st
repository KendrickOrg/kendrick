accessing
evaluateWithModel: model	
	"This function return the rate of event, take into account the intra-pop and inter-pop interaction rate"
	"|r|
	r := (self evaluateIntraPopInteractionWithModel: model) + (self evaluateInterPopInteractionWithModel: model).
	fromStatus ~= #empty ifTrue: [ 
		r := r * ((model population at: (model getPID)) at: (fromStatus asSymbol)) currentNbIndividuals
		 ].
	^ r"
	^ (rate evaluateWithModel: model) abs