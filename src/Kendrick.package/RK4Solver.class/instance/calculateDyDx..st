as yet unclassified
calculateDyDx: model
	|i j|
	i := 1.
	j := 1.
	model PIDList do: [ :each|
		(model atParameter: #InterPopInteractionOn) ~= 'equation' ifTrue: [ model addTemporalParameter: #PID value: each ].
	    model equations do: [ :eq|
			eq variable isAnIndexedVariable ifTrue: [ 
				model parameters removeKey: ((eq variable atIndex: 1) symbol) ifAbsent: [ nil ].
				model addTemporalParameter: ((eq variable atIndex: 1) symbol) value: i ].
		 dydx at: j put: (eq expression evaluateWithModel: model).
		j := j+1.	
			 ].
		i := i+1
		 ]