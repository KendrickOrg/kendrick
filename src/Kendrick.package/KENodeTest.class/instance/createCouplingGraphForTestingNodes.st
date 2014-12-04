as yet unclassified
createCouplingGraphForTestingNodes
	|population graph|
	population := KEMetaPopulation new.
	population attributes: '{#status: [#S, #I, #R], #region: [#A, #B, #C]}'.
	graph := KEGraph on: population atAttribute: #region 
				couplingInfectionCoefficient: #beta 
				withOutsideClass: {#all->0.02} 
				insideClass: {(#all->0.0)}.
	^ graph
	