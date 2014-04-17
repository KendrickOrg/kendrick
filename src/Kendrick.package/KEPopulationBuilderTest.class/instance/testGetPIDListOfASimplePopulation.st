as yet unclassified
testGetPIDListOfASimplePopulation
	|populationBuilder|
	populationBuilder := KEPopulationBuilder new.
	self assert: (populationBuilder getPIDListOf: (self exampleOfSimplePopulation)) equals: #(0)