as yet unclassified
testBuildPopulationFromVectorCompartments
	|population populationBuilder compartments|
	populationBuilder := KEPopulationBuilder new.
	population := KEPopulation new.
	compartments := self exampleOfVectorCompartments.
	populationBuilder buildPopulation: population fromVecteurCompartment: compartments.
	
	self assert: (population getNbSubPopulations) equals: 3.
	self assert: (population atSubPopulation: 1) isACompartment equals: false.
	self assert: (population atSubPopulation: 1) getNbSubPopulations equals: 1.
	self assert: ((population atSubPopulation: 1) atSubPopulation: 1) getNbIndividuals equals: 1000