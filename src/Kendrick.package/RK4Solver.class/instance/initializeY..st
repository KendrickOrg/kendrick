as yet unclassified
initializeY: model
	|i|
	i := 1.
	model PIDList do: [ :each|
		model equations do: [ :eq|
			y at: i put: (((model population at: each) at: (eq variable symbol)) currentNbIndividuals).
			i := i+1
			 ]
		 ]