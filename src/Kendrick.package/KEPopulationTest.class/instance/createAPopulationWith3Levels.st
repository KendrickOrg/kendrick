as yet unclassified
createAPopulationWith3Levels
	|aNewPopulation|
	aNewPopulation := KEPopulation new.
	aNewPopulation nodes: #($a $b $c).
	(aNewPopulation at: $a) nodes: 3 forEach: [:node| node compartments: #((S 99999) (I 1) (R 0))].
	(aNewPopulation at: $b) nodes: 2 forEach: [:node| node compartments: #((S 99999) (I 1) (R 0))].
	(aNewPopulation at: $c) nodes: 4 forEach: [:node| node compartments: #((S 99999) (I 1) (R 0))].

	^ aNewPopulation 
	