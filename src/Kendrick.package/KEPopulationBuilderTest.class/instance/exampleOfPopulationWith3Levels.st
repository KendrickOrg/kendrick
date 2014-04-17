as yet unclassified
exampleOfPopulationWith3Levels
	|population|
	population := KEPopulation new.
	population addSubPopulation: self exampleOfPopulationWith2Levels.
	population addSubPopulation: self exampleOfPopulationWith2Levels.
	
	^ population