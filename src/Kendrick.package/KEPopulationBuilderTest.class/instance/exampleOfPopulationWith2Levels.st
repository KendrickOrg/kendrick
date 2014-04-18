as yet unclassified
exampleOfPopulationWith2Levels
	|population|
	population := KEPopulation new.
	population addSubPopulation: self exampleOfSimplePopulation.
	population addSubPopulation: self exampleOfSimplePopulation.
	population addSubPopulation: self exampleOfSimplePopulation.
	
	^ population