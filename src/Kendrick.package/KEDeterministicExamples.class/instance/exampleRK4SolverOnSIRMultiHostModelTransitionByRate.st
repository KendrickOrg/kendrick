examples
exampleRK4SolverOnSIRMultiHostModelTransitionByRate
	"self new exampleRK4SolverOnSIRMultiHostModelTransitionByRate"
	|model simulator graph output db|
	model := KEModel new.
	model population: (KEMetaPopulation new attributes: {
		#status->#(#S #I #R). 
		#species->#(#mosquito #reservoir1 #reservoir2)
	}).
	model buildFromAttributes: #(#status #species) 
			compartments: {
				#(#S #mosquito)->9999.
				#(#I #mosquito)->1.
				#(#R #mosquito)->0.
				#(#S #reservoir1)->999.
				#(#I #reservoir1)->0.
				#(#R #reservoir1)->0.
				#(#S #reservoir2)->1999.
				#(#I #reservoir2)->0.
				#(#R #reservoir2)->0}.
	model addParameter: #mu 
		   inScopes: #species->#(#mosquito #reservoir1 #reservoir2) 
		   values: #(12.17 0.05 0.05).
	model addParameter: #gamma value: 52.
	model addParameter: #N value: #sizeOfPopulation.
	"multi-host concern specifying"
	graph := KECouplingInfectionGraph newOn: model population atAttribute: #species.
	graph edges: { #mosquito->#reservoir1. #mosquito->#reservoir2 } rate: #beta values: 0.02.
	graph applyGraphTo: model.
	
	model addTransitionFrom: '{#status: #S}'
		to: '{#status: #I}'
		rate: 'beta*I' parseAsAnExpression.
	model addTransitionFrom: '{#status: #I}'
		to: '{#status: #R}'
		rate: 'gamma' parseAsAnExpression.
	model addTransitionFrom: '{#status: #S}'
		to: #empty
		rate: 'mu' parseAsAnExpression.
	model addTransitionFrom: '{#status: #I}'
		to: #empty
		rate: 'mu' parseAsAnExpression.
	model addTransitionFrom: '{#status: #R}'
		to: #empty
		rate: 'mu' parseAsAnExpression.
	model addTransitionFrom: #empty
		to: '{#status: #S}'
		rate: 'mu' parseAsAnExpression.
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 40.0 step: 0.01.
	simulator executeOn: model.
	output := simulator data.
	db := (KEDiagramBuilder new) data: (output dataAt: '{#status: #I}') do: #sqrt.
	^db view
	