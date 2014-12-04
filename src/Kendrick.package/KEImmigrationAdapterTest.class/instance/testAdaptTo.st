tests-as yet unclassified
testAdaptTo
	|model population adapter graph|
	model := KEModel new.
	population := KEMetaPopulation new.
	population attributes: '{#status: [#S, #I, #R], #region: [#A, #B, #C]}'.
	graph := KEGraph on: population atAttribute: #region immigrationCoefficient: #m betweenClasses: { #all->0.005 }. 
	model population: population.
	adapter := KEImmigrationAdapter new.
	adapter atArgument: #graph put: graph.
	adapter adaptTo: model.
	
	self assert: (model transitions size) equals: 18.
	self assert: (model transitions first probability value: model) equals: 0.005.