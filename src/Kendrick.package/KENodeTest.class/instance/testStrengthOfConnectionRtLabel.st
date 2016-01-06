as yet unclassified
testStrengthOfConnectionRtLabel
	|model  graph node|
	model := KEModel new.
	model population: KEMetaPopulation new.
	model attributes: {#status->#(#S #I #R). #region->#(#A #B #C)}.
	graph := KEContactNetwork newOn: model atAttribute: #region.
	graph edges: #all; strengthOfAllConnections: {(#status->#S)->0.1. (#status->#I)->0.05. (#status->#R)->0.2}. 
	node := graph atNode: {graph attribute->#A}.
	
	self assert: (node strengthOfConnection: {#region->#B} rtLabel: {#status->#S}) equals: 0.1.
	self assert: (node strengthOfConnection: {#region->#B} rtLabel: {#status->#I}) equals: 0.05.
	self assert: (node strengthOfConnection: {#region->#B} rtLabel: {#status->#R}) equals: 0.2
	
