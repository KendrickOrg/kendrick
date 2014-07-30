as yet unclassified
createAMetaPopulationWith3Levels
	|population aBlock|
	population := KEMetaPopulation new.
	population subPopulations: #($a $b $c).
	aBlock := [ :subPop| 
		subPop compartments: #(S I R).
		subPop at: #S put: 99999; at: #I put: 1; at: #R put: 0
		 ].
	(population at: $a) numberOfSubPopulations: 3.
	(population at: $b) numberOfSubPopulations: 2.
	(population at: $c) numberOfSubPopulations: 4.
	population forEachSubPopulation: [ :each|
		each forEachSubPopulation: aBlock ].

	^ population 
	