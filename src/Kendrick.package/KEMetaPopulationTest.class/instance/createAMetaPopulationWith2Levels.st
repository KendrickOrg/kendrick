as yet unclassified
createAMetaPopulationWith2Levels
	|population|
	population := KEMetaPopulation new.
	population numberOfSubPopulations: 3.
	population forEachSubPopulation: [ :subPop| 
		subPop compartments: #(S I R).
		subPop at: #S put: 99999; at: #I put: 1; at: #R put: 0 ].
	^ population 
	