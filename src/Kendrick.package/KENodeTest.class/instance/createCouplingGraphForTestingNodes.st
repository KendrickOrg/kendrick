as yet unclassified
createCouplingGraphForTestingNodes
	|population graph|
	population := KEMetaPopulation new.
	population attributes: '{#status: [#S, #I, #R], #region: [#A, #B, #C]}'.
	graph := KECouplingInfectionGraph newOn: population atAttribute: #region.
	graph edges: #all rate: #beta values: 0.001. 
	^ graph
	