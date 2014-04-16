as yet unclassified
testGetPIDListOfAPopulationWith2Levels
	|populationBuilder|
	populationBuilder := KEPopulationBuilder new.
	self assert: (populationBuilder getPIDListOf: (self exampleOfPopulationWith2Levels)) equals: #(#(1) #(2) #(3))