examples
exampleRK4SolverOnSIRMetaPopulationModel
	"self new exampleRK4SolverOnSIRMetaPopulationModel"
	|model simulator graph output db|
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
	"multi-host concern specifying"
	graph := KECouplingInfectionGraph newOn: model population atAttribute: #country.
	graph edges: { #Vietnam->#Laos. #Vietnam->#Campuchia } rate: #beta values: 0.02.
	graph applyGraphTo: model.
	model addEquation: 'S:t=mu*N-beta*S*I-mu*S' parseAsAnEquation.
	model addEquation: ('I:t=beta*S*I-(mu+gamma)*I' parseAsAnEquation).
	model addEquation: ('R:t=gamma*I-mu*R' parseAsAnEquation).
	
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 40.0 step: 0.01.
	simulator executeOn: model.
	output := simulator data.
	db := (KEDiagramBuilder new) data: (output dataAt: '{#status: #I}') do: #sqrt.
	^ db view