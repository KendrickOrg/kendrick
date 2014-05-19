as yet unclassified
testCreateNewPopulationForMultiSpeciesModel
	|aNewPopulation|
	aNewPopulation := KEPopulation new.
	aNewPopulation nodes: #($a $b $c).
	(aNewPopulation at: $a) compartments: #((S 9999) (I 1) (R 0)).
	(aNewPopulation at: $b) compartments: #((S 1000) (I 0) (R 0)).
	(aNewPopulation at: $c) compartments: #((S 2000) (I 0) (R 0)).
	
	self assert: (aNewPopulation nodes size) equals: 3.
	self assert: (aNewPopulation at: 1) isAPopulationOfCompartments equals: true.
	self assert: (aNewPopulation at: 1) getNbIndividuals equals: 10000.
	self assert: ((aNewPopulation at: $a) getNbIndividualsOfCompartment: #S) equals: 9999.
	