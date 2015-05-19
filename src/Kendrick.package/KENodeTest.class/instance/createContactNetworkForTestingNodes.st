as yet unclassified
createContactNetworkForTestingNodes
	|population graph|
	population := KEMetaPopulation new.
	population attributes: '{#status: [#S, #I, #R], #region: [#A, #B, #C]}'.
	graph := KEContactNetwork newOn: population atAttribute: #region.
	graph edges: #all; strengthOfAllConnections: 0.001. 
	^ graph
	