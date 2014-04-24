as yet unclassified
calculateDyDx: model
	"In this function checkHasInterPopInteraction if available and evaluate equation expression with adding the interPopInteractionRate"
	|i j|
	i := 1.
	j := 1.
	model PIDList do: [ :each|
		 model addTemporalParameter: #PID value: each.
	    model equations do: [ :eq|
			eq variable isAnIndexedVariable ifTrue: [ 
				"model parameters removeKey: ((eq variable atIndex: 1) symbol) ifAbsent: [ nil ]."
				model addTemporalParameter: ((eq variable atIndex: 1) symbol) value: i ].
		 dydx at: j put: ((eq expression evaluateWithModel: model) + (eq evaluateInterPopInteractionWithModel: model)).
		j := j+1.	
			 ].
		i := i+1
		 ]