as yet unclassified
createAMetaPopulationWith3Levels

	metaPopulationWith3Levels := KEMetaPopulation new.
	metaPopulationWith3Levels subPopulations: #($a $b $c).
	(metaPopulationWith3Levels at: $a) numberOfSubPopulations: 3.
	(metaPopulationWith3Levels at: $b) numberOfSubPopulations: 2.
	(metaPopulationWith3Levels at: $c) numberOfSubPopulations: 4.
	metaPopulationWith3Levels forEachSubPopulation: [ :each|
		each forEachSubPopulation: 
		[:eachPop| 
		eachPop compartments: #(S I R).
		eachPop at: #S put: 99999; at: #I put: 1; at: #R put: 0
		 ]
		 ]

 
	