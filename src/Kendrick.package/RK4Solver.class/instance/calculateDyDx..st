as yet unclassified
calculateDyDx: model
	"In this function checkHasInterPopInteraction if available and evaluate equation expression with adding the interPopInteractionRate"
	|i j|
	i := 1.
	j := 1.
	model PIDList do: [ :each|
		 model setPID: each.
	    model equations do: [ :eq|
			eq variable isAnIndexedVariable ifTrue: [ 
				model addTemporalParameter: ((eq variable atIndex: 1) symbol) value: i ].
		 	dydx at: j put: (eq expression evaluateWithModel: model).
			j := j+1.	
			 ].
		"model equations do: [ :eq| eq resetInterRate ]".
		i := i+1
		 ]