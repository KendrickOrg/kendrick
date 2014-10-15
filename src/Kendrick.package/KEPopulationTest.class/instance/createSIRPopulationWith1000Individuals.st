as yet unclassified
createSIRPopulationWith1000Individuals
	
	anSIRPopulationWith1000Individuals := KEPopulation new.
	anSIRPopulationWith1000Individuals compartments: #(S I R).
	anSIRPopulationWith1000Individuals at: #S put: 99999; at: #I put: 1; at: #R put: 0