as yet unclassified
testGetPIDListOfAPopulationWith3Levels
	|populationBuilder|
	populationBuilder := KEPopulationBuilder new.
	self assert: (populationBuilder getPIDListOf: (self exampleOfPopulationWith3Levels)) equals: #(#(1 1) #(1 2) #(1 3) #(2 1) #(2 2) #(2 3))