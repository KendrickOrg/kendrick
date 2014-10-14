as yet unclassified
calculateDyDx: model
	"In this function checkHasInterPopInteraction if available and evaluate equation expression with adding the interPopInteractionRate"
	|j|
	j := 1.
	model subPopulations do: [ :each|
		 model currentSubPopulation: each.
		 model setIndex: each populationID.
	    model equations do: [ :eq|
		 	dydx at: j put: (eq evaluateWithModel: model).
			j := j+1.	
			 ]		
		 ]