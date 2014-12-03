tests
testCreateCouplingGraphForMultiHostModel
	|population graph|
	population := KEPopulation new.
	population attributes: '{#status: [#S, #I, #R], #specie: [#mosquito, #reservoir1, #reservoir2]}'.
	graph := KEGraph on: population atAttribute: #specie 
				couplingInfectionCoefficient: #beta 
				withOutsideClass: {
				#(#mosquito #reservoir1)->0.02. 
				#(#mosquito #reservoir2)->0.02} 
				insideClass: {(#all->0.0)}.
	self assert: (graph nodes size) equals: 3.
	self assert: (graph edges size) equals: 5