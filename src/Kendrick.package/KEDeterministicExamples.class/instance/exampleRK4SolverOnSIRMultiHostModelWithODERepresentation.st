examples
exampleRK4SolverOnSIRMultiHostModelWithODERepresentation
	"self new exampleRK4SolverOnSIRMultiHostModelWithODERepresentation"
	|model simulator graph db|
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
	model 
		addParameter: #mu
		value: 
		[ :aModel| |c| 
			c := aModel currentCompartment at: #species.
			c = #mosquito ifTrue: [ ^ 12.17 ].
			c = #reservoir1 ifTrue: [ ^ 0.05 ].
			c = #reservoir2 ifTrue: [ ^ 0.05 ]
		].
	model addParameter: #v value: 52.
	model addParameter: #beta value: 1.
	model addParameter: #N value: #sizeOfPopulation.
	model configurations: { #sizeOfPopulation->#(#species) }.
	
	graph := KEContactNetwork newOn: model population atAttribute: #species.
	graph edges: { #mosquito->#reservoir1. #mosquito->#reservoir2 };
			strengthOfAllConnections: 0.02.
	
	model addEquation: 'S:t=mu*N-beta*S*I-mu*S' parseAsAnEquation.
	model addEquation: ('I:t=beta*S*I-(mu+v)*I' parseAsAnEquation).
	model addEquation: ('R:t=v*I-mu*R' parseAsAnEquation).
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 0.5 step: 0.0027.
	simulator executeOn: model.
	db := (KEDiagramBuilder new) data: ((simulator timeSeriesAt: '{#status: #I}') sqrt).
	^ db view
	