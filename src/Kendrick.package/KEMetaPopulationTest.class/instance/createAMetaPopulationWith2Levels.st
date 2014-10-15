as yet unclassified
createAMetaPopulationWith2Levels

	metaPopulationWith2Levels := KEMetaPopulation new.
	metaPopulationWith2Levels numberOfSubPopulations: 3.
	metaPopulationWith2Levels forEachSubPopulation: [ :subPop| 
		subPop compartments: #(S I R).
		subPop at: #S put: 99999; at: #I put: 1; at: #R put: 0 ]
	