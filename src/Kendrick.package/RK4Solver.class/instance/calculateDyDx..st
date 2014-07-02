as yet unclassified
calculateDyDx: model
	"In this function checkHasInterPopInteraction if available and evaluate equation expression with adding the interPopInteractionRate"
	|j|
	j := 1.
	model PIDList do: [ :each|
		 model setPID: each.
		 each isArray ifTrue: [ model setIndex: (each last) ].
	    model equations do: [ :eq|
		 	dydx at: j put: ("eq expression evaluateWithModel: model) + (eq evaluateCouplingInteraction: model" eq evaluateWithModel: model).
			j := j+1.	
			 ]		
		 ]