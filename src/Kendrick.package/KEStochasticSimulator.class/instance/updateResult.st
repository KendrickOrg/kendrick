as yet unclassified
updateResult
	|i|
	i := 1.
	model subPopulations do: [ :pop|
		model equations do: [ :eq|
			(result at: i) add: (pop at: (eq variable symbol)) currentNbIndividuals.
			i := i + 1.
			 ]
		 ]