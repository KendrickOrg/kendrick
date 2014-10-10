accessing
getNbIndividuals
	|total|
	total := 0.
	subPopulations do: [ :each|
		total := total + (each getNbIndividuals)
		 ].
	^ total