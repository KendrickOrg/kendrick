examples
modelRK4SolverOnSIRMetaPopulation
	"self new exampleRK4SolverOnSIRMetaPopulationModel"
	|model |
	model := KEModel new.
	model population: (KEMetaPopulation new attributes: {
		#status->#(#S #I #R). 
		#country->#(#Vietnam #Laos #Campuchia)
	}).
	model buildFromAttributes: #(#status #country) 
			compartments: {
				#(#S #Vietnam)->9800.
				#(#I #Vietnam)->200.
				#(#R #Vietnam)->0.
				#(#S #Laos)->1000.
				#(#I #Laos)->0.
				#(#R #Laos)->0.
				#(#S #Campuchia)->2000.
				#(#I #Campuchia)->0.
				#(#R #Campuchia)->0}.
	model addParameter: #mu 
		   inScopes: #country->#(#Vietnam #Laos #Campuchia) 
		   values: #(12.17 0.05 0.05).
	model addParameter: #gamma value: 52.
	model addParameter: #N value: #sizeOfPopulation.
	^ model