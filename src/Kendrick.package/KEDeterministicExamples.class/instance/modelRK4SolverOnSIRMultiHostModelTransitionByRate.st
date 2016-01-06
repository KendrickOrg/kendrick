examples
modelRK4SolverOnSIRMultiHostModelTransitionByRate
	"self new exampleRK4SolverOnSIRMultiHostModelTransitionByRate"

	| model graph |
	model := KEModel new.
	model
		population:
			(KEMetaPopulation new).
			model
				attributes:
					{(#status -> #(#S #I #R)).
					(#species -> #(#mosquito #reservoir1 #reservoir2))}.
	model
		buildFromAttributes: #(#status #species)
		compartments:
			{(#(#S #mosquito) -> 9999).
			(#(#I #mosquito) -> 1).
			(#(#R #mosquito) -> 0).
			(#(#S #reservoir1) -> 999).
			(#(#I #reservoir1) -> 0).
			(#(#R #reservoir1) -> 0).
			(#(#S #reservoir2) -> 1999).
			(#(#I #reservoir2) -> 0).
			(#(#R #reservoir2) -> 0)}.
	
	model 
		addParameter: #mu
		value: 
		[ :aModel| |c val| 
			c := aModel currentCompartment at: #species.
			c = #mosquito ifTrue: [ val := 12.17 ].
			c = #reservoir1 ifTrue: [ val := 0.05 ].
			c = #reservoir2 ifTrue: [ val := 0.05 ].
			val
		].
	model addParameter: #gamma value: 52.
	model addParameter: #beta value: 1.
	model atParameter: #N assignValue: [ :aModel| |c| 
		c := aModel currentCompartment at: #species.
		aModel sizeOfPopulation: c
		].
	"model configurations: { #sizeOfPopulation->#(#species) }."
	
	graph := KEContactNetwork newOn: model population atAttribute: #species.
	graph edges: { #mosquito->#reservoir1. #mosquito->#reservoir2 };
			strengthOfAllConnections: 0.02.
	
	model addTransitionFrom: '{#status: #S}' to: '{#status: #I}' probability: 'beta*I' parseAsAnExpression.
	model addTransitionFrom: '{#status: #I}' to: '{#status: #R}' probability: 'gamma' parseAsAnExpression.
	model addTransitionFrom: '{#status: #S}' to: #empty probability: 'mu' parseAsAnExpression.
	model addTransitionFrom: '{#status: #I}' to: #empty probability: 'mu' parseAsAnExpression.
	model addTransitionFrom: '{#status: #R}' to: #empty probability: 'mu' parseAsAnExpression.
	model addTransitionFrom: #empty to: '{#status: #S}' probability: 'mu' parseAsAnExpression.
	^ model