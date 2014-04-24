as yet unclassified
testBuildPopulationWithExistingSubPopulationsFromVectorCompartments
	|population populationBuilder compartments|
	populationBuilder := KEPopulationBuilder new.
	population := KEPopulation new.
	1 to: 3 do: [ :id| population addSubPopulation: (KEPopulation new) ].
	compartments := self exampleOfVectorCompartments.
	populationBuilder build: population from: compartments.
	
	self assert: (population atSubPopulation: 1) getNbSubPopulations equals: 1.
	self assert: ((population atSubPopulation: 1) atSubPopulation: 1) getNbIndividuals equals: 1000
	