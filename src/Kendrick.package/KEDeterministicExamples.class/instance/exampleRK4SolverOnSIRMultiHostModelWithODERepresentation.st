examples
exampleRK4SolverOnSIRMultiHostModelWithODERepresentation
	"self new exampleRK4SolverOnSIRMultiHostModelWithODERepresentation"
	|model simulator graph output db|
	model := KEModel new.
	model population: (KEMetaPopulation new attributes: {
		#status->#(#S #I #R). 
		#species->#(#mosquito #reservoir1 #reservoir2)
	}).
	model buildFromAttributes: #(#status #species) 
			compartments: {
				#(#S #mosquito)->9800.
				#(#I #mosquito)->200.
				#(#R #mosquito)->0.
				#(#S #reservoir1)->1000.
				#(#I #reservoir1)->0.
				#(#R #reservoir1)->0.
				#(#S #reservoir2)->2000.
				#(#I #reservoir2)->0.
				#(#R #reservoir2)->0}.
	model addParameter: #mu 
		   inScopes: {#species->#mosquito. #species->#reservoir1. #species->#reservoir2}
		   values: #(12.17 0.05 0.05).
	model addParameter: #v value: 52.
	model addParameter: #beta value: 1.
	model addParameter: #N value: #sizeOfPopulation.
	
	graph := KEContactNetwork newOn: model population atAttribute: #species.
	graph edges: { #mosquito->#reservoir1. #mosquito->#reservoir2 };
			strengthOfAllConnections: 0.02.
	
	model addEquation: 'S:t=mu*N-beta*S*I-mu*S' parseAsAnEquation.
	model addEquation: ('I:t=beta*S*I-(mu+v)*I' parseAsAnEquation).
	model addEquation: ('R:t=v*I-mu*R' parseAsAnEquation).
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 0.5 step: 0.0027.
	simulator executeOn: model.
	output := simulator data.
	db := (KEDiagramBuilder new) data: (output dataAt: '{#status: #I}') do: #sqrt.
	^ db view
	