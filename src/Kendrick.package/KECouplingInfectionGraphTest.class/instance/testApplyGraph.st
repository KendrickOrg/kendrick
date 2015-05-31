tests-as yet unclassified
testApplyGraph
	|model population graph|
	model := KEModel new.
	population := KEMetaPopulation new.
	population attributes: '
		{#status: [#S, #I, #R], 
		#species: [#mosquito, #reservoir1, #reservoir2]}'.
	graph := KECouplingInfectionGraph 
					newOn: population 
					atAttribute: #species.
	graph edges: { #mosquito->#reservoir1. #mosquito->#reservoir2 } 
			rate: #beta 
			values: 0.02.
	model population: population.
	graph applyGraphTo: model.
	
	self assert: (model parameters size) equals: 3.
	self assert: (model atParameter: '{{#species: #mosquito}:#beta}') size equals: 3
	