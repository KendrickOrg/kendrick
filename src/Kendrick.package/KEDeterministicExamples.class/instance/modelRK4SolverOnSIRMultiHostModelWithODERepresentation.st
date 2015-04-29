examples
modelRK4SolverOnSIRMultiHostModelWithODERepresentation
	"self new exampleRK4SolverOnSIRMultiHostModelWithODERepresentation"

	| model |
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
			{(#(#S #mosquito) -> 9800).
			(#(#I #mosquito) -> 200).
			(#(#R #mosquito) -> 0).
			(#(#S #reservoir1) -> 1000).
			(#(#I #reservoir1) -> 0).
			(#(#R #reservoir1) -> 0).
			(#(#S #reservoir2) -> 2000).
			(#(#I #reservoir2) -> 0).
			(#(#R #reservoir2) -> 0)}.
	model addParameter: #mu inScopes: #species -> #(#mosquito #reservoir1 #reservoir2) values: #(12.17 0.05 0.05).
	model addParameter: #v value: 52.
	model addParameter: #N value: #sizeOfPopulation.
	^ model