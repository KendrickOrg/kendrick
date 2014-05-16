as yet unclassified
updateResult
	|i|
	i := 1.
	model PIDList do: [ :aPID|
		model equations do: [ :eq|
			(result at: i) add: ((model population at: aPID) at: (eq variable symbol)) currentNbIndividuals.
			i := i + 1.
			 ]
		 ]