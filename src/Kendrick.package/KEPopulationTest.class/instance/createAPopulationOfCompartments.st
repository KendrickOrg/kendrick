as yet unclassified
createAPopulationOfCompartments
	|aNewPopulation|
	aNewPopulation := KEPopulation new.
	aNewPopulation compartments: #((S 99999) (I 1) (R 0)).
	
	^ aNewPopulation 
	