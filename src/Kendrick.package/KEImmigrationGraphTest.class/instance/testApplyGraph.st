tests-as yet unclassified
testApplyGraph
	|model population graph|
	model := KEModel new.
	population := KEMetaPopulation new.
	population attributes: '{#status: [#S, #I, #R], #region: [#A, #B, #C]}'.
	graph := KEImmigrationGraph newOn: population atAttribute: #region.
	graph edges: #all rate: #m values: 0.005.
	model population: population.
	graph applyGraphTo: model.
	
	self assert: model transitions size equals: 18.
	self assert: (model transitions first from at: #status)=(model transitions first to at: #status) equals: true.
	self assert: (model transitions first from at: #region)=(model transitions first to at: #region) equals: false.