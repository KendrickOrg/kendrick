accessing
nbOfIndividuals
	|total|
	total := 0.
	subPopulations do: [ :each|
		total := total + (each nbOfIndividuals)
		 ].
	^ total