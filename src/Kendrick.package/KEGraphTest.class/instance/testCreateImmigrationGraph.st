tests
testCreateImmigrationGraph
	|population graph|
	population := KEMetaPopulation new.
	population attributes: '{#status: [#S, #I, #R], #region: [#A, #B, #C]}'.
	graph := KEGraph on: population atAttribute: #region immigrationCoefficient: #m betweenClasses: { #all->0.005 }.
	self assert: (graph nodes size) equals: 3.
	self assert: (graph edges size) equals: 3