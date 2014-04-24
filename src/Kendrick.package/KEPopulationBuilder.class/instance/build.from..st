as yet unclassified
build: population from: compartments
	|values|
	values := compartments values.
	values first isCollection 
	ifTrue: [ 
		values do: [ :each| 
			self build: population fromVecteur: each ]
		 ]
	ifFalse: [ 
		values do: [ :each|
			population addSubPopulation: each.
			 ]
		 ]