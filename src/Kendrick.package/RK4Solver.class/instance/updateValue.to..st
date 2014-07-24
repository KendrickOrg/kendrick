as yet unclassified
updateValue: k to: model
	|i|
	i := 1.
	k = y ifTrue: [ 
		k := k collect: [ :each| 0 ] ].
	model populationIDs do: [ :each|
		model equations do: [ :eq|
			((model population at: each) at: (eq variable symbol)) currentNbIndividuals: ((k at: i)/2 + (y at: i)).
			i := i+1
			 ]
		 ]