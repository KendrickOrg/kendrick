as yet unclassified
initializeData: model
	|i|
	i := 1.
	model PIDList do: [ :each|
		model equations do: [ :eq|
			data at: i put: (Array new: (self nbOfIterations)).
			i := i+1
			 ]
		 ]