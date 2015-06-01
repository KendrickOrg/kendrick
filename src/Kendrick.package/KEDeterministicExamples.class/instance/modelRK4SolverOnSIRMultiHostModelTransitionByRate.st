examples
modelRK4SolverOnSIRMultiHostModelTransitionByRate
	"self new exampleRK4SolverOnSIRMultiHostModelTransitionByRate"

	| model graph |
	model := KEModel new.
	model
		population:
			(KEMetaPopulation new
				attributes:
					{(#status -> #(#S #I #R)).
					(#species -> #(#mosquito #reservoir1 #reservoir2))}).
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
	
	model addParameter: #mu 
		   inScopes: {#species->#mosquito. #species->#reservoir1. #species->#reservoir2}
		   values: #(12.17 0.05 0.05).
	model addParameter: #gamma value: 52.
	model addParameter: #beta value: 1.
	model addParameter: #N value: #sizeOfPopulation.
	model configurations: { #sizeOfPopulation->#(#species) }.
	
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