as yet unclassified
createAPopulationOfCompartments
	|population|
	population := KEPopulation new.
	population compartments: #(S I R).
	population at: #S put: 99999; at: #I put: 1; at: #R put: 0.
	
	^ population 
	