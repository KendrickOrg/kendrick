DSL Syntax
compartments: aCollection
	subPopulationNames addAll: aCollection.
	aCollection do: [ :each|
		|aCompartment|
		aCompartment := KECompartment status: each initialNumberOfIndividuals: 0.
		subPopulations add: aCompartment
		 ].
	^ self
 
	