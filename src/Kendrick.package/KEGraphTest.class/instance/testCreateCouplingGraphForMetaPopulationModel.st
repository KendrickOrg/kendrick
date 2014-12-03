tests
testCreateCouplingGraphForMetaPopulationModel
	|population graph|
	population := KEPopulation new.
	population attributes: '{#status: [#S, #I, #R], #region: [#A, #B, #C]}'.
	graph := KEGraph on: population atAttribute: #region 
				couplingInfectionCoefficient: #beta 
				withOutsideClass: {#all->0.02} 
				insideClass: {(#all->0.0)}.
	self assert: (graph nodes size) equals: 3.
	self assert: (graph edges size) equals: 6