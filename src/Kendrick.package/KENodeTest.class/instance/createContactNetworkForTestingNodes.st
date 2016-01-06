as yet unclassified
createContactNetworkForTestingNodes
	|model  graph|
	model := KEModel new.
	model population: KEMetaPopulation new.
	model attributes: {#status->#(#S #I #R). #region->#(#A #B #C)}.
	graph := KEContactNetwork newOn: model atAttribute: #region.
	graph edges: #all; strengthOfAllConnections: 0.001. 
	^ graph
	