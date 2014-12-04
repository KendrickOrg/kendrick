tests-as yet unclassified
testApplyGraph
	|model population graph|
	model := KEModel new.
	population := KEMetaPopulation new.
	population attributes: '{#status: [#S, #I, #R], #region: [#A, #B, #C]}'.
	graph := KEGraph on: population atAttribute: #region immigrationCoefficient: #m betweenClasses: { #all->0.005 }. 
	model population: population.
	graph applyGraph: model.
	
	self assert: model transitions size equals: 18.
	self assert: (model transitions first from at: #status)=(model transitions first to at: #status) equals: true.
	self assert: (model transitions first from at: #region)=(model transitions first to at: #region) equals: false.