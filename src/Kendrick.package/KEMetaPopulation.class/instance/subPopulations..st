accessing
subPopulations: aNameCollection
	subPopulationNames addAll: aNameCollection.
	1 to: (aNameCollection size) do: [ :i|
		self addSubPopulation: (KEMetaPopulation new)
		 ]