tests-as yet unclassified
testAdaptTo
	|model population adapter graph|
	model := KEModel new.
	population := KEMetaPopulation new.
	population attributes: '{#status: [#S, #I, #R], #species: [#mosquito, #reservoir1, #reservoir2]}'.
	graph := KECouplingInfectionGraph newOn: population atAttribute: #species.
	graph edges: { #mosquito->#reservoir1. #mosquito->#reservoir2 } rate: #beta values: 0.02. 
	model population: population.
	adapter := KECouplingAdapter new.
	adapter atArgument: #graph put: graph.
	adapter adaptTo: model.
	self assert: (model parameters) size equals: 3.
	self assert: (model atParameter: '{{#species:#reservoir1}:#beta}') isDictionary equals: true  