as yet unclassified
initializeY: model
	|i|
	i := 1.
	model subPopulations do: [ :each|
		model equations do: [ :eq|
			y at: i put: ((each at: (eq variable symbol)) currentNbIndividuals).
			i := i+1
			 ]
		 ]