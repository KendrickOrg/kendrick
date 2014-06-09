as yet unclassified
createAPopulationWith2Levels
	|aNewPopulation|
	aNewPopulation := KEPopulation new.
	aNewPopulation nodes: 3.
	(aNewPopulation at: 1) compartments: #((S 99999) (I 1) (R 0)).
	(aNewPopulation at: 2) compartments: #((S 99999) (I 1) (R 0)).
	(aNewPopulation at: 3) compartments: #((S 99999) (I 1) (R 0)).
	
	^ aNewPopulation 
	