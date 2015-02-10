tests-as yet unclassified
testApplyGraph
	|model population graph|
	model := KEModel new.
	population := KEMetaPopulation new.
	population attributes: '{#status: [#S, #I, #R], #specie: [#mosquito, #reservoir1, #reservoir2]}'.
	graph := KEGraph on: population atAttribute: #specie 
				couplingInfectionCoefficient: #beta 
				withOutsideClass: {
				#(#mosquito #reservoir1)->0.02. 
				#(#mosquito #reservoir2)->0.02} 
				insideClass: {(#all->0.0)}.
	model population: population.
	graph applyGraphTo: model.

	self assert: (model parameters size) equals: 3.
	self assert: (model atParameter: '{{#specie: #mosquito}:#beta}') size equals: 3
	