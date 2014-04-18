as yet unclassified
updateValue: k to: model
	|i|
	i := 1.
	k = y ifTrue: [ 
		k := k collect: [ :each| 0 ] ].
	model PIDList do: [ :each|
		model equations do: [ :eq|
			((model population atSubPopulation: each) atSubPopulation: (eq variable symbol)) currentNbIndividuals: ((k at: i)/2 + (y at: i)).
			i := i+1
			 ]
		 ]